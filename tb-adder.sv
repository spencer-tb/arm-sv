// Testbench
module test;

  logic [31:0] a;
  logic [31:0] b;
  bit carryOut;
  logic [31:0] s;

  // Instantiate design under test
  nBitAdder #(32) nba(.a, .b, .carryOut, .s);
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    checkAdder(1);
  end
  
  
  task automatic checkAdder(input int n);
    fork
      begin
        a = 32'h3;
        b = 32'h4;
        assert (s==32'h7) $display ("A:%0d + B:%0d equals S:%0d", a, b, s);
          else $error("A:%0d + B:%0d doesn't equals:%0d", a, b, s);
      end
    join
  endtask

endmodule
