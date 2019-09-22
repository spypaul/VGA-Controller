`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////
//Sync2x8TestBench.v
//This module is a testbench for Sync2x8
//it gives the DUT the clock, the reset, and the switch inputs to test the DUT functionality
//the output should delay the switch signals for 2 clock cycle
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////////////////


module Sync2x8TestBench;
wire [7:0 ]ASYNC0;
reg CLK, ACLR_L; 
wire [7:0] SYNC; 
reg [1:0]seq; 
Sync2x8 DUT (.ASYNC0(ASYNC0), .CLK(CLK), .ACLR_L(ACLR_L), .SYNC(SYNC));

// creates 100Mhz clock signal
initial CLK <= 1'b0;
always #20 CLK <= ~CLK;

// the reset signals 
// deactivate after 40ns
initial 
begin 
    ACLR_L <= 1'b0;
    #40 ACLR_L <= 1'b1;
end

initial  seq = 2'b01; // testvector that would generate a pulse
// create a left shift register to shift in the testvector to the ASYNC0 inputs
initial 
begin
     repeat(10) @ (posedge CLK);
     repeat(2) @ (posedge CLK) seq<= {seq[0],1'b0};
end
assign ASYNC0[0] = seq[1];
assign ASYNC0[1] = seq[1];
assign ASYNC0[2] = seq[1];
assign ASYNC0[3] = seq[1];
assign ASYNC0[4] = seq[1];
assign ASYNC0[5] = seq[1];
assign ASYNC0[6] = seq[1];
assign ASYNC0[7] = seq[1];
endmodule
