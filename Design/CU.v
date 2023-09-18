`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17/01/2023 05:08:59 PM
// Design Name: 
// Module Name: CU
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


module CU(
input [5:0] OpCode,
input [5:0] func,
output reg MemtoReg,
output reg MemWrite,
output reg Branch,
output reg [2:0] ALUControl,
output reg ALUSrc,
output reg [1:0] ALUop,
output reg RegDst,
output reg RegWrite ,output reg jump
);
always @(*)
begin
	
   case(OpCode)
        6'b000000: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b110000100;
        6'b100011: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b101001000;
        6'b101011: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b0x101x000;
        6'b000100: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b0x010x010;
        6'b001000: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b101000000;
        6'b000010: {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b0xxx0xxx1;
        default:{RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,jump} = 9'b0;
   endcase
    casex({ALUop,func})
        	8'b00??????: ALUControl = 3'b010;
                8'b01??????: ALUControl = 3'b100;
                8'b10100000:ALUControl = 3'b010;
                8'b10100010:ALUControl = 3'b100;
                8'b10101010:ALUControl = 3'b110;
                8'b10011100:ALUControl = 3'b101;
        default : ALUControl=010;
    endcase

end 
    
endmodule
