`timescale 1ns/1ns

module test;

reg wr_clk;
reg wr_nrst;
reg wr_en;
reg [DATA_WIDTH-1: 0] wdata;
reg rd_clk;
reg rd_nrst;
reg rd_en;
wire [DATA_WIDTH-1: 0] rdata;
wire fifo_empty;
wire fifo_full;

//generate clock
initial begin
    wr_clk =0;
    forever #100 wr_clk = ~wr_clk;
end
initial begin
    rd_clk =0;
    forever #100 rd_clk = ~rd_clk;
end
//gennerate reset
initial begin
    wr_nrst =0;
    rd_nrst =0;
    rd_en =0;
end
reg data_vld;

//generate write logic
initial begin :write_fifo
    wr_en =0;
    rd_en=0;
    wdata =0;
    forever begin
        #1
        @(posedge wr_clk)
            if(~wr_nrst)begin
                wr_en <= 0;
                wdata <= 0;
            end else if(~fifo_full)begin
                wr_en <= 1;
                wdata <= $random;
            end else begin
                wr_en <=0;
                wdata <= 0;
                //disable write_fifo;
            end
    end
end

//generate read logic
always@(fifo_empty or rd_nrst)begin:read_fifo
    if(~rd_nrst)
        rd_en = 0;
    else
        rd_en = ~fifo_empty;
end

AsyncFifo afifo(
.io_wr_clk(wr_clk),
.io_wr_nrst (wr_nrst),
.io_wr_en(wr_en),
.io_wdata(wdata),
.io_rd_clk(rd_clk),
.io_rd_nrst(~rd_nrst),
.io_rd_en(rd_en),
.io_rdata (rdata),
.io_empty(fifo_empty),
.io_full(fifo_full)
);

//initial
//begin
//    $dumpfile("waves.vcd");
//    $dumpvars(0,test);
//    #100000 $finish;
//end

endmodule : test
