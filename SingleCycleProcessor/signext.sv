module signext(input logic[31:0] a, output logic[63:0] y);

always_comb 
  casez (a[31:21])
    11'b111_1100_0000, 11'b111_1100_0000 : begin // tipo D
      y = {{55{a[20]}}, a[20:12]};
    end

    11'b101_1010_0??? : begin // CBZ
      y = {{45{a[23]}}, a[23:5]};
    end
    default : 
      y = 0;
  endcase

endmodule
