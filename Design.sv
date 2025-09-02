module dff (
  input  din,clk,rst,
  output reg  dout
);

  always@(posedge clk)
    begin 
      
      if (rst)
        dout <= 1'b0;
      
      else 
        dout <= din;
    
    
    
    end 
 
// Assertion block
  always @(posedge clk) begin
    #1; // let DUT settle

    // Reset check
    if (rst) begin
      A1: assert (dout == 1'b0)
        $info("Reset OK: dout=%0b at %0t", dout, $time);
      else
        $error("Reset FAIL: dout=%0b (expected 0) at %0t", dout, $time);
    end 

    // Functional check
    else begin
      A2: assert (dout == din)
        $info("DFF OK: din=%0b, dout=%0b at %0t", din, dout, $time);
      else
        $error("DFF FAIL: din=%0b, dout=%0b at %0t", din, dout, $time);
    end
  end
  
endmodule
