`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 12:09:34
// Design Name: 
// Module Name: MIPS_top
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

module MIPS_top (
    input [31:0] uvm_inst,
    input uvm_mux_sel,
    input clk, rst,
    output [31:0] test_value,
    output [31:0] reg_data,
    output [31:0] Write_Data,
    output [31:0] PC_input,
    output [31:0] Pc
);
    
    wire mem_write;
    wire [31:0] ALU_out;
    //wire [31:0] Write_Data;
    wire [31:0] Read_Data;
   // wire [31:0] Pc;
    wire [31:0] Instr;
    wire locked;
    wire clk_out1;
  /*   clk_wiz_0 inst
  (
  // Clock out ports  
  .clk_out1(clk_out1),
  // Status and control signals               
  .reset(rst), 
  .locked(locked),
 // Clock in ports
  .clk_in1(clk_in1)
  );*/
    data_mem Data_mem_top_mips(
        .clk(clk), 
        .rst(rst), 
        .WE(mem_write),
        .A(ALU_out),
        .WD(Write_Data),
        .RD(Read_Data),
        .test_value(test_value)
    );
    
    inst_mem  Instruction_mem_top_mips(
        .pc_out(Pc),
        .instruction(Instr)
    );
    
    mips top_mips(
        .uvm_mux_sel(uvm_mux_sel),
        .uvm_inst(uvm_inst),
        .clk(clk), 
        .rst(rst),
	.PC_input(PC_input),
	.reg_data(reg_data),
        .Instr(Instr),
        .Read_Data(Read_Data),
        .Pc(Pc),
        .Write_Data(Write_Data),
        .ALU_out(ALU_out),
        .mem_write(mem_write)
    );
    
endmodule
