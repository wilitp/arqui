module imem_tb ();
  logic[5:0] addr;
  logic[31:0] q;
  imem #(32) dut(addr, q);

  always begin
    addr = 1;
    #2;
    $display("q: %h", q);
    $stop;
  end



endmodule
