module signext_tb();
logic clk;
logic [31:0] instr;
logic [63:0] out;

signext dut(instr, out);

always begin
  // Primero pruebo stur con inmediatos positivo y negativo
  instr = 32'b11111000000_01111111111_00010_00001;
  #2;
  
  $display("Output positivo stur: %b", out);

  instr = 32'b11111000000_11111111111_00010_00001;
  #2;
  $display("Output negativo stur: %b", out);

  // Primero pruebo cbz con inmediatos positivo y negativo
  instr = 32'b101_1010_0_0111111111111111111_00001;
  #2;
  $display("Output negativo cbz: %b", out);

  instr = 32'b101_1010_0_1111111111111111111_00001;
  #2;
  $display("Output negativo cbz: %b", out);

  $stop();

end
endmodule
