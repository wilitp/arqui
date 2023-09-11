module execute #(int N=64)(
 input logic AluSrc,
 input logic[3:0] AluControl,
 input logic[N-1:0] PC_E,
 input logic[N-1:0] signImm_E,
 input logic[N-1:0] readData1_E,
 input logic[N-1:0] readData2_E,

 output logic[N-1:0] PCBranch_E,
 output logic[N-1:0] aluResult_E,
 output logic[N-1:0] writeData_E,
 output logic zero_E
);

  logic[N-1:0] aluOperand;

  assign writeData_E = readData2_E;

  alu Alu(readData1_E, aluOperand, AluControl, zero_E, aluResult_E);

  adder #(N-1) Add(PC_E, signImm_E << 2, PCBranch_E);

  mux2 #(N-1) Mux(readData2_E, signImm_E, AluSrc, aluOperand);
endmodule
