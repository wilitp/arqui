module execute (
 input logic AluSrc,
 input logic[3:0] AluControl,
 input logic[63:0] PC_E,
 input logic[63:0] signImm_E,
 input logic[63:0] readData1_E,
 input logic[63:0] readData2_E,

 output logic[63:0] PCBranch_E,
 output logic[63:0] aluResult_E,
 output logic[63:0] writeData_E,
 output logic zero_T
);

  logic[63:0] aluOperand;

  assign writeData_E = readData2_E;


  alu Alu(readData1_E, aluOperand, AluControl, zero_T, aluResult_E);

  adder #(64) Add(PC_E, signImm_E << 2, PCBranch_E);

  mux2 #(64) Mux(readData2_E, signImm_E, AluSrc, aluOperand);
endmodule
