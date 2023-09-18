`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:47:24 AM
// Design Name: 
// Module Name: uvm_mux
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


module uvm_mux(
    input sel,
    input [31:0] inst_mem,uvm_inst,
    output [31:0] inst
    );
    
   assign inst = sel? uvm_inst:inst_mem;
endmodule
