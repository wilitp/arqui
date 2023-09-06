module fetch (
  input logic PCSrc_F,
  input logic clk,
  input logic reset,
  input logic[63:0] PCBranch_F,
  output logic[63:0] imem_addr_F
);

  logic[63:0] next_addr;
  logic[63:0] out_from_mux;

  adder #(64) Adder(imem_addr_F, 64'd4, next_addr);
  mux2 #(64) Mux(next_addr, PCBranch_F, PCSrc_F, out_from_mux);
  flopr #(64) PC(clk, out_from_mux, reset, imem_addr_F);
  
endmodule

