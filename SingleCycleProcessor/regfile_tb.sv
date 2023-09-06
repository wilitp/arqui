module regfile_tb ();
  logic clk;
  logic we3;
  logic[4:0] ra1;
  logic [4:0] ra2;
  logic [4:0] wa3;
  logic [63:0] wd3;
  logic[63:0] rd1;
  logic[63:0] rd2;

  regfile file(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
  always begin
    clk = 1;
    #5;   
    clk = 0;
    #5;   
  end
  initial
    begin
      ra1 = 0;
      ra2 = 0;
  end
  always @(posedge clk) begin
    #1;
    if (ra1 != rd1) begin
      $display("Error: ra1 = %d != rd1 = %d", ra1, rd1);
    end
    if (ra2 != rd2) begin
      $display("Error: ra1 = %d != rd1 = %d", ra2, rd2);
    end
    #1;
    ra1++;
    ra2++;
    #1;
    if(ra1 == 31) begin
      $stop();
    end
  end
endmodule
