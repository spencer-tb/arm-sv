// Design
// nBitAdder

module nBitAdder (a, b, carryOut, s);
  parameter n = 32;  
  input  logic [n-1:0] a;
  input  logic [n-1:0] b; 
  output bit carryOut;
  output logic [n-1:0] s;
  
  bit carryIn;
  always_comb begin
    for (int i=0; i<n; i++) begin
        if (i==0) begin//halfadder
            assign s = (a[i] ^ b[i]);
            assign carryOut =  (a[i] & b[i]);
        end else begin //fulladder
            carryIn = carryOut;
            assign s = (a[i] ^ b[i]) ^ carryIn;
            assign carryOut = (b[i] & carryIn) | (a[i] & b[i]) | (a[i] & carryIn);
        end
    end
  end

endmodule
