`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2022 04:52:59 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input wire [4:0] A1,
    input wire [4:0]A2,
    input wire [4:0]A3,
    input wire WE3,clk,rst,
    input  [31:0]  WD3,
    input [2:0] alu,////
    output  [31:0] RD1,
    output  [31:0] RD2
    
    );
    reg [31:0] reg_file [31:0];
    
    integer i;
   /* always @ (*)
    begin
        RD1 <= reg_file[A1];
        RD2 <= reg_file[A2];
	
    end*/
assign RD1 = reg_file[A1];
    assign  RD2 = reg_file[A2];
    always @(posedge clk or negedge rst)
    begin
	//$display ("RD1[A1] = %0d ----- RD2[A2] = %0d ", RD1,RD2);
	//$display ("A1 = %0d ----- A2 = %0d ", A1,A2);
        if(!rst)
            begin
            for(i=0;i<32;i=i+1) begin
                reg_file[i]<=i;
		//$display ("reg_file [%0d] = %0d -----",i,reg_file[i]);
		end
            end

        else begin 
            if( WE3)
            begin
                reg_file[A3]<=WD3;
            end 
        end   
	
    end
    
endmodule
