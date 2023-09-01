module alu(input logic[63:0]a, input logic[63:0]b, input logic[3:0] control, output logic zero, output logic[63:0] result);

logic miss;

always_comb begin
  casez (control)
    4'b0000: begin
      result = a & b;
      miss = 0;
    end
    4'b0001: begin
      result = a | b;
      miss = 0;
    end
    4'b0010: begin
      result = a + b;
      miss = 0;
    end
    4'b0110: begin
      result = a - b;
      miss = 0;
    end
    4'b0111: begin
      result = b;
      miss = 0;
    end
    default:  begin
      result = 0;
      miss = 1;
    end
  endcase

  if (~miss && result == 0) begin
    zero = 1;
  end else begin
    zero = 0;
  end
end

endmodule
