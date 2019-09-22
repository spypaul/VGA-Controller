`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////
//VGADriverTestBench.v
//This module is a testbench for Clk25Mhz 
//it gives the DUT the clock, the reset inputs to test the DUT functionality
//the output should be a 25Mhz clock signal
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////////////////


module Clk25MhzTestBench;
reg CLKIN, ACLR_L;
wire CLKOUT; 

Clk25Mhz DUT(.CLKIN(CLKIN), .ACLR_L(ACLR_L), .CLKOUT(CLKOUT));

// creates 100Mhz clock signal
initial CLKIN <= 1'b0;
always #5 CLKIN <= ~CLKIN;

// the reset signals 
// deactivate after 30ns
initial 
begin 
    ACLR_L<= 1'b0;
    #30 ACLR_L <= 1'b1;
end

endmodule

