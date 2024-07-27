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
    output  reg[31:0] RD1,
    output  reg[31:0] RD2
    
    );
    reg [31:0] ff_RD1 , ff_RD2;
    reg [31:0] reg_file [31:0];
    reg [4:0] ff_A1_1 ,ff_A1_2;
    reg [4:0] ff_A2_1 ,ff_A2_2;
    reg [4:0] ff_A3_1 ,ff_A3_2;
    reg [31:0] ff_wd_1,ff_wd_2;
    reg ff_WE_1,ff_WE_2;
    integer i;
 /*   always @(posedge clk or negedge rst) begin
        if(!rst) begin
            ff_RD1 <=0;
            ff_RD2 <=0;
            ff_A1_1 <= 0;
            ff_A1_2 <= 0;
            ff_A2_1 <= 0;
            ff_A2_2 <= 0;
            ff_A3_1 <= 0;
            ff_A3_2 <= 0;
            ff_WE_1 <= 0;
            ff_WE_2 <= 0;
            ff_wd_1 <=0;
            ff_wd_2 <=0;
        end
        else begin
            ff_A1_1 <= A1;
            ff_A1_2 <= ff_A1_1;
            ff_A2_1 <= A2;
            ff_A2_2 <= ff_A2_1;
            ff_A3_1 <= A3;
            ff_A3_2 <= ff_A3_1 ;
            ff_WE_1 <= WE3;
            ff_WE_2 <= ff_WE_1;
            ff_wd_1 <= WD3;
            ff_wd_2 <= ff_wd_1;
        end
    end*/
    always @ (*)
    begin
       /// ff_RD1 <=reg_file[ff_A1_2];
       // ff_RD2 <=reg_file[ff_A2_2];
        RD1 <= reg_file[A1];
        RD2 <= reg_file[A2];
    end
    
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
            for(i=0;i<32;i=i+1)
                reg_file[i]<=i;
            end
        else begin 
            if( WE3)
            begin
                reg_file[A3]<=WD3;
            end 
        end      
    end
    
endmodule
