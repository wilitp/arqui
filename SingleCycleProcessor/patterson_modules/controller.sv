// CONTROLLER

module controller(input logic [10:0] instr,
            // Input y output de excepciones. Esto entra y sale del micro
            input logic ExtIRQ,
            input logic reset,
            output logic ExtIAck,
            // Conexiones del controller con el datapath en relacion
            // a excepciones
            input logic ExcAck,
            output logic [3:0] EStatus,
            output logic Exc, ERet,

						output logic [3:0] AluControl,						
            output logic [1:0] Branch,
						output logic reg2loc, regWrite, AluSrc, 
											memtoReg, memRead, memWrite);
											
	logic [1:0] AluOp_s;

  logic NotAnInstr;

  assign Exc = (ExtIRQ | NotAnInstr) & ~reset;
  assign ExtIAck = ExcAck & ExtIRQ & ~reset;

  always_comb 
    if (reset) EStatus = 4'b0000;
    else if(NotAnInstr) EStatus = 4'b0010;
    else if (ExtIRQ) EStatus = 4'b0001;
    else EStatus = 4'b0000;
											
	maindec 	decPpal 	(.Op(instr), 
							.Reg2Loc(reg2loc), 
							.ALUSrc(AluSrc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch), 
							.ALUOp(AluOp_s),
              .NotAnInstr(NotAnInstr),
              .reset(reset)
              );	
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl),
              .reset(reset)
              );
			
endmodule
