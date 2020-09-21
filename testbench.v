`timescale 1ns/1ns

module test;
    parameter DATA_WIDTH=8;
    parameter ADDR_WIDTH =4;
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
//generate reset
    initial begin
        wr_nrst =0;
        rd_nrst =0;
        rd_en =0;
    end
    reg data_vld;

    initial begin
        wr_en =0;
        rd_en=0;
        wdata =0;
        data_vld = 0;
        forever begin
            @(posedge wr_clk)
                if(~wr_nrst)begin
                    data_vld <= 0;
                    wdata    <= 0;
                end else if(~fifo_full)begin
                    data_vld <= 1;
                    wdata    <= $random;
                end else begin
                    data_vld <=0;
                end
        end
    end

    always@(fifo_full or data_vld or wr_nrst)begin
        if(~wr_nrst)
            wr_en = 0;
        else
            wr_en = ~fifo_full & data_vld;
        end

always@(fifo_empty or rd_nrst)begin
    if(~rd_nrst)
        rd_en = 0;
    else
        rd_en = ~fifo_empty;
end

AsyncFifoB afifo(
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

initial
begin
    $dumpfile("waves.vcd");
    $dumpvars(0,test);
    #100000 $finish;
end

endmodule
