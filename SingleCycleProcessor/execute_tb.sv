module execute_tb ();
  logic AluSrc;
  logic[3:0] AluControl;
  logic[63:0] PC_E;
  logic[63:0] signImm_E;
  logic[63:0] readData1_E;
  logic[63:0] readData2_E;

  logic[63:0] PCBranch_E;
  logic[63:0] aluResult_E;
  logic[63:0] writeData_E;
  logic zero_T;

  execute dut(AluSrc, AluControl, PC_E, signImm_E, readData1_E, readData2_E, PCBranch_E, aluResult_E, writeData_E, zero_T);

  initial begin

    // Caso sumar dos registros
    AluSrc = 1'b0;
    AluControl = 4'b0010;
    PC_E = 64'h0;
    signImm_E = 64'h8;
    readData1_E = 64'h0;
    readData2_E = 64'h5;


    #10;
    // Caso sumar registro e inmediato
    AluSrc = 1'b1;
    AluControl = 4'b0010;
    PC_E = 64'h0;
    signImm_E = 64'h4;
    readData1_E = 64'h0;
    readData2_E = 64'h5;

    #10;
    // Caso sumar registro e inmediato pero da cero
    AluSrc = 1'b1;
    AluControl = 4'b0010;
    PC_E = 64'h0;
    signImm_E = 64'h0;
    readData1_E = 64'h0;
    readData2_E = 64'h5;

    #10;
    
     
  end
endmodule
