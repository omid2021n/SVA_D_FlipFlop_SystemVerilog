module  tb;
  
 reg  din,clk,rst;
 wire dout;
  always  #5 clk=~clk;
   
  dff  dut(din,clk ,rst,dout);
    
    // Stimulus
  initial begin
    // Initialize
    clk = 0;
    rst = 1;
    din = 0;

    $dumpfile("dump.vcd");
    $dumpvars;
  

    // Apply reset for 2 cycles
    #12;
    rst = 0;

    // Drive din values
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;

    // Assert reset again
    #10 rst = 1;
    #10 rst = 0;

    // More data
    #10 din = 1;
    #10 din = 0;

    // Finish
    #50;
    $finish();
  end
  
   initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #110;
    $finish();
  end
  
  
  
  endmodule

  
  
