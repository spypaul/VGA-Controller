`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//VGADriver.v
//This is a top level module for a VGA driver design
//It takes the input from the switch to choose the color to display on the monitor
//It outputs the 4bits color code for RGB
//It also outputs the horizontal and vertical sync signal
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////


module VGADriver(CLK, ARST_L, SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, HSYNC, VSYNC, RED, GREEN, BLUE);
input CLK, ARST_L, SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7;
output HSYNC, VSYNC;
output [3:0]RED, GREEN, BLUE;
wire dotclk_i; // internal signal for 25Mhz clock
wire [7:0] sync_i;
wire [7:0] swbus_i;// internal bus for all the switch input
assign swbus_i = {SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0}; 


Clk25Mhz U1(.CLKIN(CLK), .ACLR_L(ARST_L), .CLKOUT(dotclk_i));
Sync2x8 U2(.ASYNC0(swbus_i), .CLK(dotclk_i), .ACLR_L(ARST_L), .SYNC(sync_i));
//the HCOORD and the VCOORD output signals of the VGAEncoder are left unconnected 
VGAEncoder U3(.CLK(dotclk_i), .CSEL(sync_i), .ARST_L(ARST_L), .HSYNC(HSYNC), .VSYNC(VSYNC), .RED(RED), .GREEN(GREEN), .BLUE(BLUE), .HCOORD(), .VCOORD());

endmodule
