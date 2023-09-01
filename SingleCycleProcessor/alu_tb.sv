module alu_tb();
  logic [63:0] a;
  logic [63:0] b;
  logic [3:0] control;
  logic zero;
  logic[63:0] result;
  alu dut(a, b, control, zero, result);
  always begin
    control = 'b0010;
    a = 1;
    b = 2;
    #2;
    $display("Suma de positivos: %d, %d", result, zero);

    #2;

    control = 'b0110;
    a = 1;
    b = 2;
    #2;
    $display("Resta de positivos: %d, %d", result, zero);

    #2;

    control = 'b0001;
    a = 2;
    b = 1;
    #2;
    $display("OR de positivos: %d, %d", result, zero);

    #2;

    control = 'b0000;
    a = 2;
    b = 1;
    #2;
    $display("AND de positivos: %d, %d", result, zero);

    #2;

    control = 'b1000;
    a = 2;
    b = 1;
    #2;
    $display("OP no especificada, result: %d, zero: %d", result, zero);
    $stop();
  end
endmodule
