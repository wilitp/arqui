// Etapa: MEMORY

module memory (
         input logic Branch_M, zero_M,
         input logic[63:0]Imm_Branch,
         input logic[63:0]Abs_Branch,
         output logic[63:0]Def_Branch,
			   output logic PCSrc_M
         );

  always_comb begin
    casez (Branch_M)
      0 : begin // No branch
        PCSrc_M = 0;
        Def_Branch = Imm_Branch;
      end
      1 : begin // CBZ
        PCSrc_M = 1;
        Def_Branch = Imm_Branch;
      end
      2 : begin // BR
        PCSrc_M = 1;
        Def_Branch = Abs_Branch;
      end
      
      default : begin
        PCSrc_M = 0;
        Def_Branch = Imm_Branch;
      end
    endcase
    
  end


endmodule
