module flopr_tb();
  logic clk;
  logic r;
  logic [63:0] in, out;

  // instantiate device under test
  flopr #(64) ff(clk, in, r, out);
  // generate clock
  always // no sensitivity list, so it always executes
    begin
     clk = 1; #5; clk = 0; #5;
    end

  initial
    begin
      in = 0;
  end

  always @(negedge clk) begin
    // Checkeo output del fflop
    if(out !== 0 && in < 5)
      $display("Error(<=5): output %d, expected %d", out, 0);
    if(out !== in && in >= 5)
      $display("Error (>5): output %d, expected %d", out, in);
    if(in == 11)
      $stop();
  end

  always @(negedge clk) begin
    // Actualizo entradas para el proximo ciclo
    #1;
    in = in + 1; 
    if(in <= 4) begin
      r = 1;
    end
    else begin
      r = 0;
    end
  end

endmodule
