`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2023 09:45:32
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input rst,
    input [31:0] pc_in,
    output reg [31:0] pc_out
    );
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            pc_out <=0;
        end
        else begin
            pc_out <= pc_in;
        end
    end
    
    
    
endmodule
