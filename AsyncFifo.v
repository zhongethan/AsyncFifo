module AsyncFifo(
  input         io_wr_clk,
  input         io_wr_nrst,
  input         io_wr_en,
  input  [31:0] io_wdata,
  input         io_rd_clk,
  input         io_rd_nrst,
  input         io_rd_en,
  output [31:0] io_rdata,
  output        io_empty,
  output        io_full
);
  reg [31:0] regs [0:3]; // @[AsyncFifo.scala 21:25]
  reg [31:0] _RAND_0;
  wire [31:0] regs__T_40_data; // @[AsyncFifo.scala 21:25]
  wire [1:0] regs__T_40_addr; // @[AsyncFifo.scala 21:25]
  wire [31:0] regs__T_8_data; // @[AsyncFifo.scala 21:25]
  wire [1:0] regs__T_8_addr; // @[AsyncFifo.scala 21:25]
  wire  regs__T_8_mask; // @[AsyncFifo.scala 21:25]
  wire  regs__T_8_en; // @[AsyncFifo.scala 21:25]
  reg [2:0] _T; // @[AsyncFifo.scala 27:29]
  reg [31:0] _RAND_1;
  wire  _T_1; // @[AsyncFifo.scala 28:40]
  wire  _T_2; // @[AsyncFifo.scala 28:37]
  wire [2:0] _GEN_15; // @[AsyncFifo.scala 28:59]
  wire [2:0] _T_4; // @[AsyncFifo.scala 28:59]
  wire [1:0] _T_9; // @[AsyncFifo.scala 36:37]
  wire [2:0] _GEN_16; // @[AsyncFifo.scala 36:43]
  wire [2:0] wr_ptr_gray; // @[AsyncFifo.scala 36:43]
  reg [2:0] _T_11; // @[AsyncFifo.scala 38:31]
  reg [31:0] _RAND_2;
  reg [2:0] _T_12; // @[AsyncFifo.scala 39:32]
  reg [31:0] _RAND_3;
  wire  _T_13; // @[AsyncFifo.scala 41:35]
  wire  _T_14; // @[AsyncFifo.scala 41:58]
  wire  _T_15; // @[AsyncFifo.scala 41:43]
  wire  _T_16; // @[AsyncFifo.scala 42:34]
  wire  _T_17; // @[AsyncFifo.scala 42:55]
  wire  _T_18; // @[AsyncFifo.scala 42:42]
  reg  _T_19; // @[AsyncFifo.scala 43:25]
  reg [31:0] _RAND_4;
  wire  _T_22; // @[AsyncFifo.scala 44:35]
  wire  _T_23; // @[AsyncFifo.scala 45:21]
  wire  _T_24; // @[AsyncFifo.scala 45:7]
  wire  _T_25; // @[AsyncFifo.scala 46:22]
  wire  _T_26; // @[AsyncFifo.scala 46:49]
  wire  _T_27; // @[AsyncFifo.scala 46:33]
  reg [2:0] _T_29; // @[AsyncFifo.scala 52:29]
  reg [31:0] _RAND_5;
  wire  _T_30; // @[AsyncFifo.scala 53:40]
  wire  _T_31; // @[AsyncFifo.scala 53:37]
  wire [2:0] _GEN_17; // @[AsyncFifo.scala 53:60]
  wire [2:0] _T_33; // @[AsyncFifo.scala 53:60]
  wire [1:0] _T_34; // @[AsyncFifo.scala 56:27]
  wire  _GEN_6; // @[AsyncFifo.scala 57:26]
  wire [1:0] _T_41; // @[AsyncFifo.scala 58:37]
  wire [2:0] _GEN_18; // @[AsyncFifo.scala 58:43]
  wire [2:0] rd_ptr_gray; // @[AsyncFifo.scala 58:43]
  reg [2:0] _T_43; // @[AsyncFifo.scala 60:31]
  reg [31:0] _RAND_6;
  reg [2:0] _T_44; // @[AsyncFifo.scala 61:32]
  reg [31:0] _RAND_7;
  reg  _T_45; // @[AsyncFifo.scala 63:26]
  reg [31:0] _RAND_8;
  reg [1:0] regs__T_40_addr_pipe_0;
  reg [31:0] _RAND_9;
  assign regs__T_40_addr = regs__T_40_addr_pipe_0;
  assign regs__T_40_data = regs[regs__T_40_addr]; // @[AsyncFifo.scala 21:25]
  assign regs__T_8_data = io_wdata;
  assign regs__T_8_addr = _T[1:0];
  assign regs__T_8_mask = 1'h1;
  assign regs__T_8_en = io_wr_en & _T_1;
  assign _T_1 = io_full == 1'h0; // @[AsyncFifo.scala 28:40]
  assign _T_2 = io_wr_en & _T_1; // @[AsyncFifo.scala 28:37]
  assign _GEN_15 = {{2'd0}, _T_2}; // @[AsyncFifo.scala 28:59]
  assign _T_4 = _GEN_15 + _T; // @[AsyncFifo.scala 28:59]
  assign _T_9 = _T_4[2:1]; // @[AsyncFifo.scala 36:37]
  assign _GEN_16 = {{1'd0}, _T_9}; // @[AsyncFifo.scala 36:43]
  assign wr_ptr_gray = _GEN_16 ^ _T_4; // @[AsyncFifo.scala 36:43]
  assign _T_13 = _T_12[2]; // @[AsyncFifo.scala 41:35]
  assign _T_14 = _T_12[1]; // @[AsyncFifo.scala 41:58]
  assign _T_15 = _T_13 ^ _T_14; // @[AsyncFifo.scala 41:43]
  assign _T_16 = wr_ptr_gray[2]; // @[AsyncFifo.scala 42:34]
  assign _T_17 = wr_ptr_gray[1]; // @[AsyncFifo.scala 42:55]
  assign _T_18 = _T_16 ^ _T_17; // @[AsyncFifo.scala 42:42]
  assign _T_22 = _T_16 != _T_13; // @[AsyncFifo.scala 44:35]
  assign _T_23 = _T_15 == _T_18; // @[AsyncFifo.scala 45:21]
  assign _T_24 = _T_22 & _T_23; // @[AsyncFifo.scala 45:7]
  assign _T_25 = wr_ptr_gray[0]; // @[AsyncFifo.scala 46:22]
  assign _T_26 = _T_12[0]; // @[AsyncFifo.scala 46:49]
  assign _T_27 = _T_25 == _T_26; // @[AsyncFifo.scala 46:33]
  assign _T_30 = io_empty == 1'h0; // @[AsyncFifo.scala 53:40]
  assign _T_31 = io_rd_en & _T_30; // @[AsyncFifo.scala 53:37]
  assign _GEN_17 = {{2'd0}, _T_31}; // @[AsyncFifo.scala 53:60]
  assign _T_33 = _GEN_17 + _T_29; // @[AsyncFifo.scala 53:60]
  assign _T_34 = _T_29[1:0]; // @[AsyncFifo.scala 56:27]
  assign _GEN_6 = _T_31; // @[AsyncFifo.scala 57:26]
  assign _T_41 = _T_33[2:1]; // @[AsyncFifo.scala 58:37]
  assign _GEN_18 = {{1'd0}, _T_41}; // @[AsyncFifo.scala 58:43]
  assign rd_ptr_gray = _GEN_18 ^ _T_33; // @[AsyncFifo.scala 58:43]
  assign io_rdata = regs__T_40_data; // @[AsyncFifo.scala 57:14]
  assign io_empty = _T_45; // @[AsyncFifo.scala 65:14]
  assign io_full = _T_19; // @[AsyncFifo.scala 47:13]
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
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_11 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_12 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_19 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_29 = _RAND_5[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_43 = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_44 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_45 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  regs__T_40_addr_pipe_0 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (io_wr_nrst) begin
    _T = 3'h0;
  end
  if (io_wr_nrst) begin
    _T_19 = 1'h0;
  end
  if (io_rd_nrst) begin
    _T_29 = 3'h0;
  end
  if (io_rd_nrst) begin
    _T_45 = 1'h1;
  end
end
  always @(posedge io_wr_clk) begin
    if(regs__T_8_en & regs__T_8_mask) begin
      regs[regs__T_8_addr] <= regs__T_8_data; // @[AsyncFifo.scala 21:25]
    end
    _T_11 <= _GEN_18 ^ _T_33;
    _T_12 <= _T_11;
  end
  always @(posedge io_rd_clk) begin
    _T_43 <= _GEN_16 ^ _T_4;
    _T_44 <= _T_43;
    if (_GEN_6) begin
      regs__T_40_addr_pipe_0 <= _T_34;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      _T <= 3'h0;
    end else begin
      _T <= _GEN_15 + _T;
    end
  end
  always @(posedge io_wr_clk or posedge io_wr_nrst) begin
    if (io_wr_nrst) begin
      _T_19 <= 1'h0;
    end else begin
      _T_19 <= _T_24 & _T_27;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      _T_29 <= 3'h0;
    end else begin
      _T_29 <= _GEN_17 + _T_29;
    end
  end
  always @(posedge io_rd_clk or posedge io_rd_nrst) begin
    if (io_rd_nrst) begin
      _T_45 <= 1'h1;
    end else begin
      _T_45 <= rd_ptr_gray == _T_44;
    end
  end
endmodule
