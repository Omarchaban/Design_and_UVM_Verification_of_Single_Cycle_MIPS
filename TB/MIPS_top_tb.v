`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 12:13:08
// Design Name: 
// Module Name: MIPS_top_tb
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


module MIPS_top_tb(

    );
    
    
    reg clk;
    reg rst;
    wire [31:0] test_value;
    wire [31:0] Instr;
    reg  [31:0] uvm_inst;
    reg uvm_mux_sel;

    new_top DUT(.clk_in1(clk),.uvm_inst(uvm_inst),.uvm_mux_sel(uvm_mux_sel),.rst(rst),.test_value(test_value));
    initial begin
    clk=0;
    uvm_mux_sel=0;
        rst=1 ; #50;
        rst=0 ; #10;
        rst=1 ; #10;
    
    end
    always begin
        clk=~clk;  #5;
    end
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
