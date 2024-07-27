//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 31.01.2023 12:07:34
//// Design Name: 
//// Module Name: MIPS
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////



module mips (
    input [31:0] uvm_inst,
    input uvm_mux_sel,
    input clk, rst,
    input [31:0] Instr,
    input [31:0] Read_Data,
    output mem_write,
    output [31:0] Pc,
    output [31:0] Write_Data,
    output [31:0] ALU_out,
    output [31:0] reg_data,
    output [31:0] PC_input
);
    wire [31:0] Instr1;
    wire [2:0] ALU_control;
    wire Jump;
    wire MemtoReg;
    wire branch;
    wire ALU_src;
    wire Reg_Dst;
    wire Reg_write;
    wire [31:0] Instr1;
    CU CU_mips(
        .OpCode(Instr1[31:26]),
        .func(Instr1[5:0]),
        .MemtoReg(MemtoReg),
        .MemWrite(mem_write),
        .Branch(branch),
        .ALUSrc(ALU_src),
        .RegDst(Reg_Dst),
        .RegWrite(Reg_write),
        .jump(Jump),
        .ALUControl(ALU_control)
    );
    DataPath DataPath_mips(
        .uvm_mux_sel(uvm_mux_sel),
        .uvm_inst(uvm_inst),
        .clk(clk),
        .rst(rst),
	.PC_input(PC_input),
        .Instr(Instr),
        .Read_Data(Read_Data),
        .ALU_control(ALU_control),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .branch(branch),
        .ALU_src(ALU_src),
        .Reg_Dst(Reg_Dst),
        .Reg_write(Reg_write),
        .PC(Pc),
	.reg_data(reg_data),
        .ALU_out(ALU_out),
        .Write_Data(Write_Data),
        .Instr1(Instr1)
    );

endmodule