module maindec (
  input logic[10:0] Op,
  input logic reset,
  output logic Reg2Loc,
  output logic ALUSrc,
  output logic MemtoReg,
  output logic RegWrite,
  output logic MemRead,
  output logic MemWrite,
  output logic Branch,
  output logic[1:0] ALUOp,
  output logic NotAnInstr,
  output logic ERet
);

always_comb begin

  casez (Op)
    11'b1?0_0101_1000, 11'b10?_0101_0000 : begin // ops tipo R
      Reg2Loc  = 0;
      ALUSrc   = 0;
      MemtoReg = 0;
      RegWrite = 1;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      ALUOp    = 2'b10;
      NotAnInstr = 0;
      ERet = 0;
    end

    11'b111_1100_0010 : begin // LDUR
      Reg2Loc  = 0;
      ALUSrc   = 1;
      MemtoReg = 1;
      RegWrite = 1;
      MemRead  = 1;
      MemWrite = 0;
      Branch   = 0;
      ALUOp    = 2'b00;
      NotAnInstr = 0;
      ERet = 0;
    end

    11'b111_1100_0000 : begin // STUR
      Reg2Loc  = 1;
      ALUSrc   = 1;
      MemtoReg = 0;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 1;
      Branch   = 0;
      ALUOp    = 2'b00;
      NotAnInstr = 0;
      ERet = 0;
    end

    11'b101_1010_0???: begin // CBZ
      Reg2Loc  = 1;
      ALUSrc   = 0;
      MemtoReg = 0;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 1;
      ALUOp    = 2'b01;
      NotAnInstr = 0;
      ERet = 0;
    end

    11'b110_1011_0100 : begin // ERET
      Reg2Loc  = 0;
      ALUSrc   = 0;
      MemtoReg = 1'bx;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 1;
      ALUOp    = 2'b01;
      NotAnInstr = 0;
      ERet = 1;
    end
    11'b1101_010_1001 : begin // MRS
      Reg2Loc  = 1;
      ALUSrc   = 2'b1x;
      MemtoReg = 0;
      RegWrite = 1;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      ALUOp    = 2'b01;
      NotAnInstr = 0;
      ERet = 0;
      
    end
    
    default :  begin
      Reg2Loc  = 1'bx;
      ALUSrc   = 2'bxx;
      MemtoReg = 0;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      ALUOp    = 2'bxx;
      NotAnInstr = 1;
      ERet = 0;
    end
  endcase

  if (reset == 1) begin
      Reg2Loc  = 0;
      ALUSrc   = 0;
      MemtoReg = 0;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      ALUOp    = 2'b00;
      NotAnInstr = 0;
  end 
end

endmodule
