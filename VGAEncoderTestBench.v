`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////
//VGAEncoderTestBenchTestBench.v
//This module is a testbench for VGA encoder 
//it gives the DUT the clock, the reset , and the switch inputs to test the DUT functionality
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////////////////


module VGAEncoderTestBench;
reg CLK, ARST_L;
wire [7:0] CSEL;
wire HSYNC, VSYNC;
wire [3:0] RED, GREEN, BLUE;
wire [9:0] HCOORD, VCOORD;
VGAEncoder DUT(.CLK(CLK), .CSEL(CSEL), .ARST_L(ARST_L), .HSYNC(HSYNC), .VSYNC(VSYNC), .RED(RED), .GREEN(GREEN), .BLUE(BLUE), .HCOORD(HCOORD), .VCOORD(VCOORD));

// creates 25Mhz clock signal
initial
begin
     CLK <= 1'b0; 
end
always 
begin
    #20CLK <= ~CLK;
end
// the reset signals 
// deactivate after 1000ns
initial 
begin
    ARST_L <= 1'b0;
    #1000 ARST_L <= 1'b1;
end

assign CSEL = 8'b00000010; //the test vector for the color blue
                           //can be changed to other test vectors

endmodule
