package asyncfifo
import chisel3._

class AsyncFifo (width : Int, depth : Int) extends RawModule {
  val io = IO(new Bundle() {
    // write clock domain
    val wr_clk = Input(Clock())
    val wr_nrst = Input(AsyncReset())
    var wr_en = Input(Bool())
    val wdata = Input(UInt(width.W))

    // read clock domain
    val rd_clk = Input(Clock())
    val rd_nrst = Input(AsyncReset())
    var rd_en = Input(Bool())
    val rdata = Output(UInt(width.W))
    val empty = Output(UInt(1.W))
    val full = Output(UInt(1.W))
  })
  // regs num = 2 ^ depth
  val regs = SyncReadMem(1 << depth, UInt(width.W))
  val wr_ptr_gray = Wire(UInt((depth+1).W))
  val rd_ptr_gray = Wire(UInt((depth+1).W))

  withClockAndReset(io.wr_clk,io.wr_nrst){
    // generate write pointer, plus 1 while write a new data
    val wr_ptr_bin = RegInit(0.U((depth+1).W))
    val wr_ptr_bin_next = (io.wr_en && !io.full).asUInt() + wr_ptr_bin
    wr_ptr_bin := wr_ptr_bin_next
    val waddr = wr_ptr_bin(depth-1,0)
    // write data to regs
    when(io.wr_en && !io.full){
      regs.write(waddr,io.wdata)
    }
    // binary to gray conversion
    wr_ptr_gray := (wr_ptr_bin_next >> 1) ^ wr_ptr_bin_next
    // sync rd_ptr_gray to wr_clk domain
    val rd_ptr_r2w_d = RegNext(rd_ptr_gray)
    val rd_ptr_r2w_dd = RegNext(rd_ptr_r2w_d)
    // fifo full signal
    val rd_2nd_msb = rd_ptr_r2w_dd(depth) ^ rd_ptr_r2w_dd(depth-1)
    val wr_2nd_msb = wr_ptr_gray (depth) ^ wr_ptr_gray(depth-1)
    val f_full = RegInit(0.U(1.W))
    f_full := ((wr_ptr_gray(depth)=/=rd_ptr_r2w_dd(depth))
      && (rd_2nd_msb===wr_2nd_msb)
      && (wr_ptr_gray(depth-2,0)===rd_ptr_r2w_dd(depth-2,0)))
    io.full := f_full
  }

  withClockAndReset(io.rd_clk,io.rd_nrst){
    // generate read pointer, plus 1 while read data out
    val rd_ptr_bin = RegInit(0.U((depth+1).W))
    val rd_ptr_bin_next = (io.rd_en && !io.empty).asUInt() + rd_ptr_bin
    rd_ptr_bin := rd_ptr_bin_next
    // read data from regs
    val raddr = rd_ptr_bin(depth-1,0)
    io.rdata := regs.read(raddr,io.rd_en && !io.empty)
    rd_ptr_gray := (rd_ptr_bin_next >> 1) ^ rd_ptr_bin_next
    //sync wr_ptr_gray to rd_clk domain
    val wr_ptr_w2r_d = RegNext(wr_ptr_gray)
    val wr_ptr_w2r_dd = RegNext(wr_ptr_w2r_d)
    // fifo empty
    val f_empty = RegInit(1.U(1.W))
    f_empty := rd_ptr_gray === wr_ptr_w2r_dd
    io.empty := f_empty
  }
}
