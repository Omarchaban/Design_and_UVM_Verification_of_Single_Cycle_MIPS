`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 04:10:12 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
    input [31:0] pc_out,
    output  [31:0]instruction
    
    );
    reg [31:0] mem [0:31];
    
   initial begin
          $readmemh("program1.txt",mem);
      /*  mem[0] = 32'h00008020;
        mem[1] = 32'h20100078 ;
        mem[2] = 32'h00008820 ;
        mem[3] = 32'h201100B4 ;
        mem[4] = 32'h00009020 ;
        mem[5] = 32'h12110006 ;
        mem[6] = 32'h0211482A ;
        mem[7] = 32'h11200002 ;
        mem[8] = 32'h02308822 ;
        mem[9] = 32'h08000005 ;
        mem[10]= 32'h02118022 ;
        mem[11]= 32'h08000005 ;
        mem[12]= 32'h00109020 ;
        mem[13]= 32'hAC120000 ;*/
    end       
    
    assign instruction = mem[pc_out[31:2]];
   
   
    
endmodule
