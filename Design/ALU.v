`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2023 03:46:19 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input[31:0] SrcA,SrcB,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output reg zero
    );
    
    
    always@(*)
    begin
        case (ALUControl)
            3'b000:ALUResult = SrcA&SrcB;
                3'b001:ALUResult = SrcA|SrcB;
                3'b010:ALUResult = SrcA+SrcB;
                3'b100:ALUResult = SrcA-SrcB;
                3'b101:ALUResult = SrcA*SrcB;
                3'b110:ALUResult = (SrcA<SrcB);
            default:ALUResult =0;
        endcase
        zero =~|(ALUResult);
    end
endmodule
