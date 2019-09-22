`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////
//VGADriverTestBench.v
//This module is a testbench for VGA driver 
//it gives the DUT the clock, the reset , and the switch inputs to test the DUT functionality
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////////////////


module VGADriverTestBench;
reg CLK, ARST_L;
wire SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7; 
wire HSYNC, VSYNC;
wire [3:0] RED, GREEN, BLUE; 
VGADriver DUT(.CLK(CLK), .ARST_L(ARST_L), .SW0(SW0), .SW1(SW1), .SW2(SW2), .SW3(SW3), .SW4(SW4), .SW5(SW5), .SW6(SW6), .SW7(SW7), .HSYNC(HSYNC), .VSYNC(VSYNC)
              , .RED(RED), .GREEN(GREEN), .BLUE(BLUE));

assign {SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0} = 8'b00000010;//the test vector for the color blue
                                                              //can be changed to other test vectors
// creates 100Mhz clock signal
initial CLK <= 1'b0;
always #5CLK <= ~CLK;

// the reset signals 
// deactivate after 10ns
initial
begin 
    ARST_L <= 1'b0;
    #10ARST_L <= 1'b1;
end 


endmodule
