module mux2 #(parameter int N=64)(
  input logic[N-1:0] in1, in2,
  input logic addr,
  output logic[N-1:0] out
);

assign out = addr == 0 ? in1 : in2;
endmodule
