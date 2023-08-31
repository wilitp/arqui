module flopr
  #(parameter int N = 1)(
  input logic clk,
  input logic[N-1: 0] d,
  input logic reset,
  output logic[N-1: 0] q
);


  always_ff @(posedge clk, posedge reset) begin
    q = d;
    if (reset) begin
      q = 0;
    end
  end


endmodule




