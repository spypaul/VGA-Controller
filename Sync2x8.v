`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Sync2x8.v
//This module creates 8 serial-in serial-out left-shifting shift registers 
//for each switch input
//This allow us to use switch input signals directly 
//without having to worry about metastability or signal timing
//Shao-Peng Yang
//2/28/19: Initial Release
//////////////////////////////////////////////////////////////////////////////////


module Sync2x8(ASYNC0, CLK, ACLR_L, SYNC);
input CLK, ACLR_L; 
input [7:0]ASYNC0;
output [7:0] SYNC;

// Making the active low reset to active high internally
wire aclr_i; 
assign aclr_i = ~ACLR_L;
// 8 2bits internal buses for each shift register
reg [1:0] sreg0, sreg1, sreg2, sreg3, sreg4, sreg5, sreg6, sreg7;

// This is the serial-in serial-out left-shifting shift register for SW0
assign SYNC[0] = sreg0[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg0 <= 2'b00;
    else 
        sreg0 <= {sreg0[0], ASYNC0[0]};
end
// This is the serial-in serial-out left-shifting shift register for SW1
assign SYNC[1] = sreg1[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg1 <= 2'b00;
    else 
        sreg1 <= {sreg1[0], ASYNC0[1]};
end
// This is the serial-in serial-out left-shifting shift register for SW2
assign SYNC[2] = sreg2[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg2 <= 2'b00;
    else 
        sreg2 <= {sreg2[0], ASYNC0[2]};
end
// This is the serial-in serial-out left-shifting shift register for SW3
assign SYNC[3] = sreg3[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg3 <= 2'b00;
    else 
        sreg3 <= {sreg3[0], ASYNC0[3]};
end
// This is the serial-in serial-out left-shifting shift register for SW4
assign SYNC[4] = sreg4[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg4 <= 2'b00;
    else 
        sreg4 <= {sreg4[0], ASYNC0[4]};
end
// This is the serial-in serial-out left-shifting shift register for SW5
assign SYNC[5] = sreg5[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg5 <= 2'b00;
    else 
        sreg5 <= {sreg5[0], ASYNC0[5]};
end
// This is the serial-in serial-out left-shifting shift register for SW6
assign SYNC[6] = sreg6[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg6 <= 2'b00;
    else 
        sreg6 <= {sreg6[0], ASYNC0[6]};
end
// This is the serial-in serial-out left-shifting shift register for SW7
assign SYNC[7] = sreg7[1];

always @(posedge CLK, posedge aclr_i) 
begin
    if(aclr_i == 1'b1)
        sreg7 <= 2'b00;
    else 
        sreg7 <= {sreg7[0], ASYNC0[7]};
end
endmodule
