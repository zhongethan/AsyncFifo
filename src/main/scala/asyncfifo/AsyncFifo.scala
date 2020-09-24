package asyncfifo

import chisel3._
import chisel3.util._
import chisel3.experimental.chiselName

@chiselName
class AsyncFifo(data_width:Int, addr_width:Int) extends RawModule{
  require(addr_width>1)

  val io = IO(new Bundle() {
    // write clock domain
    val wr_clk = Input(Clock())
    val wr_nrst = Input(AsyncReset())
    val wr_en = Input(Bool()) //high-active
    val wdata = Input(UInt(data_width.W))

    // read clock domain
    val rd_clk = Input(Clock())
    val rd_nrst = Input(AsyncReset())
    val rd_en = Input(Bool()) //high_active
    val rdata = Output(UInt(data_width.W))
    val empty = Output(UInt(1.W))
    val full = Output(UInt(1.W))

  })

  // regs num = 2 ^ addr_width
  //val regs = SyncReadMem(1 << addr_width, UInt(data_width.W))
  val depth = 1<< addr_width

  // these signals will be send from one clock domain to another
  val wr_ptr_bin_next = Wire(UInt((addr_width+1).W))
  val wr_ptr_gray_next = Wire(UInt((addr_width+1).W))
  val wr_addr          = WireInit(0.U(addr_width.W))
  val rd_ptr_bin_next = Wire(UInt((addr_width+1).W))
  val rd_ptr_gray_next = Wire(UInt((addr_width+1).W))
  val rd_addr          = WireInit(0.U(addr_width.W))

  /**
    * wr_clk domain
    * 1. generate write pointer.
    * 2. convert binary pointer to gray code
    * 3. generate fifo full signal
    */
  withClockAndReset(io.wr_clk,io.wr_nrst){
    // fifo mem
    val regs = Reg(Vec(depth,UInt(data_width.W)))

    // generate write pointer, plus 1 while write a new data
    val wr_ptr_bin = RegInit(0.U((addr_width+1).W))
    wr_ptr_bin_next := (io.wr_en && !io.full).asUInt() + wr_ptr_bin
    wr_ptr_bin := wr_ptr_bin_next
    // convert binary code to gray code and register it
    wr_ptr_gray_next := oneCycleDly(binToGray(wr_ptr_bin_next))

    // write data to regs
    wr_addr := wr_ptr_bin(addr_width-1,0)
    when(io.wr_en && !io.full){
      //regs.write(wr_ptr_bin(addr_width-1,0),io.wdata)
      regs(wr_addr) := io.wdata
    }

    // read data from regs
    io.rdata := regs(rd_addr)

    // fifo full signal
    io.full := isFifoFull(twoStageSync(rd_ptr_gray_next),binToGray(wr_ptr_bin_next))
  }

  /**
    * rd_clk domain
    * 1. generate read pointer
    * 2. convert binary pointer to gray code
    * 3. generate fifo empty signal
    */
  withClockAndReset(io.rd_clk,io.rd_nrst){

    // generate read pointer, plus 1 while read data out
    val rd_ptr_bin = RegInit(0.U((addr_width+1).W))
    rd_ptr_bin_next := (io.rd_en && !io.empty).asUInt() + rd_ptr_bin
    rd_ptr_bin := rd_ptr_bin_next
    // convert binary code to gray code and register it
    rd_ptr_gray_next := oneCycleDly(binToGray(rd_ptr_bin_next))

    //generate read addr
    rd_addr := rd_ptr_bin(addr_width-1,0)
    //io.rdata := regs.read(rd_ptr_bin(addr_width-1,0),io.rd_en && !io.empty)

    // fifo empty
    io.empty := isFifoEmpty(twoStageSync(wr_ptr_gray_next),binToGray(rd_ptr_bin_next))
  }

  //--------------------------------------------------------------------------------
  //Function definition
  //--------------------------------------------------------------------------------

  private def twoStageSync(d:UInt):UInt = {
    val stage_d  = RegInit(0.U(data_width.W))
    val stage_dd = RegInit(0.U(data_width.W))
    stage_d := d
    stage_dd := stage_d
    stage_dd
  }

  private def oneCycleDly(d:UInt):UInt = {
    val dly = RegInit(0.U(data_width.W))
    dly := d
    dly
  }

  private def binToGray(d:UInt):UInt ={
    (d>>1.U) ^ d
  }

  /**
    * generate fifo full signal
    * 0000-0010-0011-0010-0110-0111-0101-0100
    * 1100-1110-1111-1110-1010-1011-1001-1000
    * the top 2 bits should be opposite and the rest should be the same
    */
  private def isFifoFull(rd_ptr:UInt,wr_ptr:UInt):Bool={
    val full = RegInit(0.U(1.W))
    full := (rd_ptr(addr_width-2,0)===wr_ptr(addr_width-2,0)) && (rd_ptr(addr_width,addr_width-1) === (~(wr_ptr(addr_width,addr_width-1))).asUInt())
    full.asBool()
  }

  /**
    * generate fifo empty signal
    * the read and write pointer should be totally the same
    */
  private def isFifoEmpty(rd_ptr:UInt,wr_ptr:UInt):Bool={
    val empty = RegInit(1.U(1.W)) //reset value = 1
    empty := rd_ptr === wr_ptr
    empty.asBool()
  }
}
