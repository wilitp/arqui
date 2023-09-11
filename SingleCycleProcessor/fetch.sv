module fetch #(int N=64)(
  input logic PCSrc_F,
  input logic clk,
  input logic reset,
  input logic[N-1:0] PCBranch_F,
  output logic[N-1:0] imem_addr_F
);

  logic[N-1:0] next_addr;
  logic[N-1:0] out_from_mux;

  adder #(N) Adder(imem_addr_F, N-1'd4, next_addr);
  mux2 #(N) Mux(next_addr, PCBranch_F, PCSrc_F, out_from_mux);
  flopr #(N) PC(clk, out_from_mux, reset, imem_addr_F);
  
endmodule

