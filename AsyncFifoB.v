module AsyncFifoB(
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
  reg [7:0] regs [0:7]; // @[AsyncFifoB.scala 29:25]
  reg [31:0] _RAND_0;
  wire [7:0] regs__T_33_data; // @[AsyncFifoB.scala 29:25]
  wire [2:0] regs__T_33_addr; // @[AsyncFifoB.scala 29:25]
  wire [7:0] regs__T_9_data; // @[AsyncFifoB.scala 29:25]
  wire [2:0] regs__T_9_addr; // @[AsyncFifoB.scala 29:25]
  wire  regs__T_9_mask; // @[AsyncFifoB.scala 29:25]
  wire  regs__T_9_en; // @[AsyncFifoB.scala 29:25]
  reg [3:0] wr_ptr_bin; // @[AsyncFifoB.scala 37:29]
  reg [31:0] _RAND_1;
  wire  _T; // @[AsyncFifoB.scala 38:37]
  wire  _T_1; // @[AsyncFifoB.scala 38:34]
  wire [3:0] _GEN_15; // @[AsyncFifoB.scala 38:56]
  wire [3:0] wr_ptr_bin_next; // @[AsyncFifoB.scala 38:56]
  wire [2:0] _GEN_16; // @[AsyncFifoB.scala 83:7]
  wire [3:0] _T_4; // @[AsyncFifoB.scala 83:7]
  wire [3:0] _T_5; // @[AsyncFifoB.scala 83:14]
  reg [7:0] dly; // @[AsyncFifoB.scala 77:22]
  reg [31:0] _RAND_2;
  reg [7:0] stage_d; // @[AsyncFifoB.scala 69:27]
  reg [31:0] _RAND_3;
  reg [7:0] stage_dd; // @[AsyncFifoB.scala 70:27]
  reg [31:0] _RAND_4;
  reg  full; // @[AsyncFifoB.scala 92:23]
  reg [31:0] _RAND_5;
  wire [1:0] _T_12; // @[AsyncFifoB.scala 93:20]
  wire [1:0] _T_13; // @[AsyncFifoB.scala 93:40]
  wire  _T_14; // @[AsyncFifoB.scala 93:31]
  wire [1:0] _T_15; // @[AsyncFifoB.scala 93:63]
  wire [1:0] _T_16; // @[AsyncFifoB.scala 93:92]
  wire [1:0] _T_17; // @[AsyncFifoB.scala 93:84]
  wire  _T_18; // @[AsyncFifoB.scala 93:79]
  reg [3:0] rd_ptr_bin; // @[AsyncFifoB.scala 54:29]
  reg [31:0] _RAND_6;
  wire  _T_21; // @[AsyncFifoB.scala 55:37]
  wire  _T_22; // @[AsyncFifoB.scala 55:34]
  wire [3:0] _GEN_18; // @[AsyncFifoB.scala 55:57]
  wire [3:0] rd_ptr_bin_next; // @[AsyncFifoB.scala 55:57]
  wire [2:0] _GEN_19; // @[AsyncFifoB.scala 83:7]
  wire [3:0] _T_25; // @[AsyncFifoB.scala 83:7]
  wire [3:0] _T_26; // @[AsyncFifoB.scala 83:14]
  reg [7:0] dly_1; // @[AsyncFifoB.scala 77:22]
  reg [31:0] _RAND_7;
  wire [2:0] _T_27; // @[AsyncFifoB.scala 62:37]
  wire  _GEN_6; // @[AsyncFifoB.scala 62:26]
  reg [7:0] stage_d_1; // @[AsyncFifoB.scala 69:27]
  reg [31:0] _RAND_8;
  reg [7:0] stage_dd_1; // @[AsyncFifoB.scala 70:27]
  reg [31:0] _RAND_9;
  reg  empty; // @[AsyncFifoB.scala 98:24]
  reg [31:0] _RAND_10;
  wire [7:0] _GEN_21; // @[AsyncFifoB.scala 99:21]
  wire [3:0] wr_ptr_gray_next; // @[AsyncFifoB.scala 31:30 AsyncFifoB.scala 42:22]
  wire [3:0] rd_ptr_gray_next; // @[AsyncFifoB.scala 33:30 AsyncFifoB.scala 59:22]
  reg [2:0] regs__T_33_addr_pipe_0;
  reg [31:0] _RAND_11;
  assign regs__T_33_addr = regs__T_33_addr_pipe_0;
  assign regs__T_33_data = regs[regs__T_33_addr]; // @[AsyncFifoB.scala 29:25]
  assign regs__T_9_data = io_wdata;
  assign regs__T_9_addr = wr_ptr_bin[2:0];
  assign regs__T_9_mask = 1'h1;
  assign regs__T_9_en = io_wr_en & _T;
  assign _T = io_full == 1'h0; // @[AsyncFifoB.scala 38:37]
  assign _T_1 = io_wr_en & _T; // @[AsyncFifoB.scala 38:34]
  assign _GEN_15 = {{3'd0}, _T_1}; // @[AsyncFifoB.scala 38:56]
  assign wr_ptr_bin_next = _GEN_15 + wr_ptr_bin; // @[AsyncFifoB.scala 38:56]
  assign _GEN_16 = wr_ptr_bin_next[3:1]; // @[AsyncFifoB.scala 83:7]
  assign _T_4 = {{1'd0}, _GEN_16}; // @[AsyncFifoB.scala 83:7]
  assign _T_5 = _T_4 ^ wr_ptr_bin_next; // @[AsyncFifoB.scala 83:14]
  assign _T_12 = stage_dd[1:0]; // @[AsyncFifoB.scala 93:20]
  assign _T_13 = _T_5[1:0]; // @[AsyncFifoB.scala 93:40]
  assign _T_14 = _T_12 == _T_13; // @[AsyncFifoB.scala 93:31]
  assign _T_15 = stage_dd[3:2]; // @[AsyncFifoB.scala 93:63]
  assign _T_16 = _T_5[3:2]; // @[AsyncFifoB.scala 93:92]
  assign _T_17 = ~ _T_16; // @[AsyncFifoB.scala 93:84]
  assign _T_18 = _T_15 == _T_17; // @[AsyncFifoB.scala 93:79]
  assign _T_21 = io_empty == 1'h0; // @[AsyncFifoB.scala 55:37]
  assign _T_22 = io_rd_en & _T_21; // @[AsyncFifoB.scala 55:34]
  assign _GEN_18 = {{3'd0}, _T_22}; // @[AsyncFifoB.scala 55:57]
  assign rd_ptr_bin_next = _GEN_18 + rd_ptr_bin; // @[AsyncFifoB.scala 55:57]
  assign _GEN_19 = rd_ptr_bin_next[3:1]; // @[AsyncFifoB.scala 83:7]
  assign _T_25 = {{1'd0}, _GEN_19}; // @[AsyncFifoB.scala 83:7]
  assign _T_26 = _T_25 ^ rd_ptr_bin_next; // @[AsyncFifoB.scala 83:14]
  assign _T_27 = rd_ptr_bin[2:0]; // @[AsyncFifoB.scala 62:37]
  assign _GEN_6 = _T_22; // @[AsyncFifoB.scala 62:26]
  assign _GEN_21 = {{4'd0}, _T_26}; // @[AsyncFifoB.scala 99:21]
  assign wr_ptr_gray_next = dly[3:0]; // @[AsyncFifoB.scala 31:30 AsyncFifoB.scala 42:22]
  assign rd_ptr_gray_next = dly_1[3:0]; // @[AsyncFifoB.scala 33:30 AsyncFifoB.scala 59:22]
  assign io_rdata = regs__T_33_data; // @[AsyncFifoB.scala 62:14]
  assign io_empty = empty; // @[AsyncFifoB.scala 64:14]
  assign io_full = full; // @[AsyncFifoB.scala 49:13]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    regs[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wr_ptr_bin = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dly = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  stage_d = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  stage_dd = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  full = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rd_ptr_bin = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  dly_1 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  stage_d_1 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  stage_dd_1 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  empty = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  regs__T_33_addr_pipe_0 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (io_wr_nrst) begin
    wr_ptr_bin = 4'h0;
  end
  if (io_wr_nrst) begin
    dly = 8'h0;
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
    rd_ptr_bin = 4'h0;
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
    empty = 1'h0;
  end
end
  always @(posedge io_wr_clk) begin
    if(regs__T_9_en & regs__T_9_mask) begin
      regs[regs__T_9_addr] <= regs__T_9_data; // @[AsyncFifoB.scala 29:25]
    end
  end
  always @(posedge io_rd_clk) begin
    if (_GEN_6) begin
      regs__T_33_addr_pipe_0 <= _T_27;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      wr_ptr_bin <= 4'h0;
    end else begin
      wr_ptr_bin <= _GEN_15 + wr_ptr_bin;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      dly <= 8'h0;
    end else begin
      dly <= {{4'd0}, _T_5};
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
      full <= _T_14 & _T_18;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      rd_ptr_bin <= 4'h0;
    end else begin
      rd_ptr_bin <= _GEN_18 + rd_ptr_bin;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      dly_1 <= 8'h0;
    end else begin
      dly_1 <= {{4'd0}, _T_26};
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
      empty <= 1'h0;
    end else begin
      empty <= stage_dd_1 == _GEN_21;
    end
  end
endmodule
