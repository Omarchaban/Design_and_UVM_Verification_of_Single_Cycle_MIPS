`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 03:55:52 PM
// Design Name: 
// Module Name: data_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_mem(
    input clk,WE,rst,
    input [31:0] A,WD,
    output  [31:0]RD,
    output   [31:0] test_value
    );
    reg [31:0] mem [0:31];
    integer i;
    always @ (posedge clk or negedge rst) begin
    if(!rst) begin
       for(i=0;i<256;i=i+1)
       mem[i] <= 32'b0;
    end
    else begin    
            if(WE) begin
                mem[A] <= WD; 
            end
        end
    end
     assign   RD = mem[A];
    assign    test_value = mem[0];
    
   
    
endmodule
