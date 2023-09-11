module mux2 #(parameter int N=64)(
  input logic[N-1:0] d0, d1,
  input logic s,
  output logic[N-1:0] y
);

assign y = s == 0 ? d0 : d1;
endmodule
