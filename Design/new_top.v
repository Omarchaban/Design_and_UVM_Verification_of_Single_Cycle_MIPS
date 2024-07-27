`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 10:46:07 AM
// Design Name: 
// Module Name: new_top
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


module new_top(
    input [31:0] uvm_inst,
    input uvm_mux_sel,
input clk_in1,
input rst,
output [31:0] test_value
    );
  /*  wire clk_out;
    clk_wiz_0 cl(
    .clk_in1(clk_in1)
    ,.clk_out1(clk_out)
    
    );*/
    MIPS_top dut (
    .uvm_inst(uvm_inst),
    .uvm_mux_sel(uvm_mux_sel),
    .clk(clk_in1),
    .rst(rst),
    .test_value(test_value)
    
    
    );
    
    
    
endmodule
