module AsyncFifo(
  input        io_wr_clk,
  input        io_wr_nrst,
  input        io_wr_en,
  input  [7:0] io_wdata,
  input        io_rd_clk,
  input        io_rd_nrst,
  input        io_rd_en,
  output [7:0] io_rdata,
  output       io_empty,
  output       io_full
);
  reg [7:0] regs_0; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_0;
  reg [7:0] regs_1; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_1;
  reg [7:0] regs_2; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_2;
  reg [7:0] regs_3; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_3;
  reg [7:0] regs_4; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_4;
  reg [7:0] regs_5; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_5;
  reg [7:0] regs_6; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_6;
  reg [7:0] regs_7; // @[AsyncFifo.scala 48:19]
  reg [31:0] _RAND_7;
  reg [3:0] wr_ptr_bin; // @[AsyncFifo.scala 51:29]
  reg [31:0] _RAND_8;
  wire  _T; // @[AsyncFifo.scala 52:37]
  wire  _T_1; // @[AsyncFifo.scala 52:34]
  wire [3:0] _GEN_24; // @[AsyncFifo.scala 52:56]
  wire [3:0] wr_ptr_bin_next; // @[AsyncFifo.scala 52:56]
  wire [2:0] _GEN_25; // @[AsyncFifo.scala 110:7]
  wire [3:0] _T_4; // @[AsyncFifo.scala 110:7]
  wire [3:0] _T_5; // @[AsyncFifo.scala 110:14]
  reg [7:0] dly; // @[AsyncFifo.scala 104:22]
  reg [31:0] _RAND_9;
  wire [2:0] wr_addr; // @[AsyncFifo.scala 58:26]
  reg [3:0] rd_ptr_bin; // @[AsyncFifo.scala 80:29]
  reg [31:0] _RAND_10;
  wire [2:0] rd_addr; // @[AsyncFifo.scala 87:26]
  wire [7:0] _GEN_17; // @[AsyncFifo.scala 65:14]
  wire [7:0] _GEN_18; // @[AsyncFifo.scala 65:14]
  wire [7:0] _GEN_19; // @[AsyncFifo.scala 65:14]
  wire [7:0] _GEN_20; // @[AsyncFifo.scala 65:14]
  wire [7:0] _GEN_21; // @[AsyncFifo.scala 65:14]
  wire [7:0] _GEN_22; // @[AsyncFifo.scala 65:14]
  reg [7:0] stage_d; // @[AsyncFifo.scala 96:27]
  reg [31:0] _RAND_11;
  reg [7:0] stage_dd; // @[AsyncFifo.scala 97:27]
  reg [31:0] _RAND_12;
  reg  full; // @[AsyncFifo.scala 120:23]
  reg [31:0] _RAND_13;
  wire [1:0] _T_11; // @[AsyncFifo.scala 121:20]
  wire [1:0] _T_12; // @[AsyncFifo.scala 121:45]
  wire  _T_13; // @[AsyncFifo.scala 121:36]
  wire [1:0] _T_14; // @[AsyncFifo.scala 121:73]
  wire [1:0] _T_15; // @[AsyncFifo.scala 121:112]
  wire [1:0] _T_16; // @[AsyncFifo.scala 121:104]
  wire  _T_17; // @[AsyncFifo.scala 121:99]
  wire  _T_20; // @[AsyncFifo.scala 81:37]
  wire  _T_21; // @[AsyncFifo.scala 81:34]
  wire [3:0] _GEN_27; // @[AsyncFifo.scala 81:57]
  wire [3:0] rd_ptr_bin_next; // @[AsyncFifo.scala 81:57]
  wire [2:0] _GEN_28; // @[AsyncFifo.scala 110:7]
  wire [3:0] _T_24; // @[AsyncFifo.scala 110:7]
  wire [3:0] _T_25; // @[AsyncFifo.scala 110:14]
  reg [7:0] dly_1; // @[AsyncFifo.scala 104:22]
  reg [31:0] _RAND_14;
  reg [7:0] stage_d_1; // @[AsyncFifo.scala 96:27]
  reg [31:0] _RAND_15;
  reg [7:0] stage_dd_1; // @[AsyncFifo.scala 97:27]
  reg [31:0] _RAND_16;
  reg  empty; // @[AsyncFifo.scala 130:24]
  reg [31:0] _RAND_17;
  wire [7:0] _GEN_30; // @[AsyncFifo.scala 131:21]
  wire [3:0] wr_ptr_gray_next; // @[AsyncFifo.scala 34:30 AsyncFifo.scala 55:22]
  wire [3:0] rd_ptr_gray_next; // @[AsyncFifo.scala 37:30 AsyncFifo.scala 84:22]
  assign _T = io_full == 1'h0; // @[AsyncFifo.scala 52:37]
  assign _T_1 = io_wr_en & _T; // @[AsyncFifo.scala 52:34]
  assign _GEN_24 = {{3'd0}, _T_1}; // @[AsyncFifo.scala 52:56]
  assign wr_ptr_bin_next = _GEN_24 + wr_ptr_bin; // @[AsyncFifo.scala 52:56]
  assign _GEN_25 = wr_ptr_bin_next[3:1]; // @[AsyncFifo.scala 110:7]
  assign _T_4 = {{1'd0}, _GEN_25}; // @[AsyncFifo.scala 110:7]
  assign _T_5 = _T_4 ^ wr_ptr_bin_next; // @[AsyncFifo.scala 110:14]
  assign wr_addr = wr_ptr_bin[2:0]; // @[AsyncFifo.scala 58:26]
  assign rd_addr = rd_ptr_bin[2:0]; // @[AsyncFifo.scala 87:26]
  assign _GEN_17 = 3'h1 == rd_addr ? regs_1 : regs_0; // @[AsyncFifo.scala 65:14]
  assign _GEN_18 = 3'h2 == rd_addr ? regs_2 : _GEN_17; // @[AsyncFifo.scala 65:14]
  assign _GEN_19 = 3'h3 == rd_addr ? regs_3 : _GEN_18; // @[AsyncFifo.scala 65:14]
  assign _GEN_20 = 3'h4 == rd_addr ? regs_4 : _GEN_19; // @[AsyncFifo.scala 65:14]
  assign _GEN_21 = 3'h5 == rd_addr ? regs_5 : _GEN_20; // @[AsyncFifo.scala 65:14]
  assign _GEN_22 = 3'h6 == rd_addr ? regs_6 : _GEN_21; // @[AsyncFifo.scala 65:14]
  assign _T_11 = stage_dd[1:0]; // @[AsyncFifo.scala 121:20]
  assign _T_12 = _T_5[1:0]; // @[AsyncFifo.scala 121:45]
  assign _T_13 = _T_11 == _T_12; // @[AsyncFifo.scala 121:36]
  assign _T_14 = stage_dd[3:2]; // @[AsyncFifo.scala 121:73]
  assign _T_15 = _T_5[3:2]; // @[AsyncFifo.scala 121:112]
  assign _T_16 = ~ _T_15; // @[AsyncFifo.scala 121:104]
  assign _T_17 = _T_14 == _T_16; // @[AsyncFifo.scala 121:99]
  assign _T_20 = io_empty == 1'h0; // @[AsyncFifo.scala 81:37]
  assign _T_21 = io_rd_en & _T_20; // @[AsyncFifo.scala 81:34]
  assign _GEN_27 = {{3'd0}, _T_21}; // @[AsyncFifo.scala 81:57]
  assign rd_ptr_bin_next = _GEN_27 + rd_ptr_bin; // @[AsyncFifo.scala 81:57]
  assign _GEN_28 = rd_ptr_bin_next[3:1]; // @[AsyncFifo.scala 110:7]
  assign _T_24 = {{1'd0}, _GEN_28}; // @[AsyncFifo.scala 110:7]
  assign _T_25 = _T_24 ^ rd_ptr_bin_next; // @[AsyncFifo.scala 110:14]
  assign _GEN_30 = {{4'd0}, _T_25}; // @[AsyncFifo.scala 131:21]
  assign wr_ptr_gray_next = dly[3:0]; // @[AsyncFifo.scala 34:30 AsyncFifo.scala 55:22]
  assign rd_ptr_gray_next = dly_1[3:0]; // @[AsyncFifo.scala 37:30 AsyncFifo.scala 84:22]
  assign io_rdata = 3'h7 == rd_addr ? regs_7 : _GEN_22; // @[AsyncFifo.scala 65:14]
  assign io_empty = empty; // @[AsyncFifo.scala 91:14]
  assign io_full = full; // @[AsyncFifo.scala 68:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  wr_ptr_bin = _RAND_8[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  dly = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  rd_ptr_bin = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  stage_d = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  stage_dd = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  full = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  dly_1 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  stage_d_1 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  stage_dd_1 = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  empty = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (io_wr_nrst) begin
    wr_ptr_bin = 4'h0;
  end
  if (io_wr_nrst) begin
    dly = 8'h0;
  end
  if (io_rd_nrst) begin
    rd_ptr_bin = 4'h0;
  end
  if (io_wr_nrst) begin
    stage_d = 8'h0;
  end
  if (io_wr_nrst) begin
    stage_dd = 8'h0;
  end
  if (io_wr_nrst) begin
    full = 1'h0;
  end
  if (io_rd_nrst) begin
    dly_1 = 8'h0;
  end
  if (io_rd_nrst) begin
    stage_d_1 = 8'h0;
  end
  if (io_rd_nrst) begin
    stage_dd_1 = 8'h0;
  end
  if (io_rd_nrst) begin
    empty = 1'h1;
  end
end
  always @(posedge io_wr_clk) begin
    if (_T_1) begin
      if (3'h0 == wr_addr) begin
        regs_0 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h1 == wr_addr) begin
        regs_1 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h2 == wr_addr) begin
        regs_2 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h3 == wr_addr) begin
        regs_3 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h4 == wr_addr) begin
        regs_4 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h5 == wr_addr) begin
        regs_5 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h6 == wr_addr) begin
        regs_6 <= io_wdata;
      end
    end
    if (_T_1) begin
      if (3'h7 == wr_addr) begin
        regs_7 <= io_wdata;
      end
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      wr_ptr_bin <= 4'h0;
    end else begin
      wr_ptr_bin <= _GEN_24 + wr_ptr_bin;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      dly <= 8'h0;
    end else begin
      dly <= {{4'd0}, _T_5};
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      rd_ptr_bin <= 4'h0;
    end else begin
      rd_ptr_bin <= _GEN_27 + rd_ptr_bin;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      stage_d <= 8'h0;
    end else begin
      stage_d <= {{4'd0}, rd_ptr_gray_next};
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      stage_dd <= 8'h0;
    end else begin
      stage_dd <= stage_d;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      full <= 1'h0;
    end else begin
      full <= _T_13 & _T_17;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      dly_1 <= 8'h0;
    end else begin
      dly_1 <= {{4'd0}, _T_25};
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      stage_d_1 <= 8'h0;
    end else begin
      stage_d_1 <= {{4'd0}, wr_ptr_gray_next};
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      stage_dd_1 <= 8'h0;
    end else begin
      stage_dd_1 <= stage_d_1;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      empty <= 1'h1;
    end else begin
      empty <= stage_dd_1 == _GEN_30;
    end
  end
endmodule
