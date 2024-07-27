`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2023 11:53:34
// Design Name: 
// Module Name: shift_left
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



module DataPath (

    input uvm_mux_sel,
    input clk,
    input rst,
    input [31:0] uvm_inst,
    input [31:0] Instr,
    input [31:0] Read_Data,
    input [2:0] ALU_control,
    input Jump,
    input MemtoReg,
    input branch,
    input ALU_src,
    input Reg_Dst,
    input Reg_write,
    output [31:0] PC,
    output [31:0] reg_data,
    output [31:0] ALU_out,
    output [31:0] Write_Data,
    output [31:0] PC_input,
    output [31:0] Instr1
);

    wire Zero;
    //wire [31:0] PC_input;
    wire [31:0] mux_D_M_result;
    wire [4:0] Write_reg;
    wire [31:0] RD1_DP, RD2_DP;
    wire [31:0] SrcB;
    wire [31:0] signIMM;
    wire [31:0] pc_mux2_out;
    wire [27:0] shiftpc;
    wire [31:0] PC_plus4;
//    wire [31:0] Instr1;
    wire PCscrc;
    wire [31:0] PCbranch;
    wire [31:0] PCbranch_in;
    
    adder               branch_adder(.x(PCbranch_in), .y(PC_plus4), .z(PCbranch));

    adder               PC_adder (.x(PC), .y(32'd4), .z(PC_plus4));

    shift_left           shiftLeft_DP(.in(signIMM), .out(PCbranch_in));

    shift_pc             shiftPC_DP(.in(Instr1[25:0]), .out(shiftpc));

    PC                  PC_DP(.clk(clk), .rst(rst), .pc_in(PC_input), .pc_out(PC));

    mux                 mux_D_M(.sel(MemtoReg), .in1(ALU_out), .in2(Read_Data), .out(mux_D_M_result));

    mux                 mux_ALU(.sel(ALU_src), .in1(RD2_DP), .in2(signIMM), .out(SrcB));

    mux                 mux_PC(.sel(Jump), .in1(pc_mux2_out), .in2({PC_plus4[31:28], shiftpc}), .out(PC_input));

    mux                 mux_PC2(.sel(PCscrc), .in1(PC_plus4), .in2(PCbranch), .out(pc_mux2_out));

    mux2                 mux_R_F(.sel(Reg_Dst), .in1(Instr1[20:16]), .in2(Instr1[15:11]), .out(Write_reg));
    
    uvm_mux             mux(.sel(uvm_mux_sel),.inst_mem(Instr),.uvm_inst(uvm_inst),.inst(Instr1));

    register_file       register_file_DP(.A1(Instr1[25:21]), .A2(Instr1[20:16]), .A3(Write_reg), .WE3(Reg_write), 
                                        .rst(rst), .clk(clk), .RD1(RD1_DP), .RD2(RD2_DP), .WD3(mux_D_M_result)); 

    ALU                 ALU_DP(.SrcA(RD1_DP), .SrcB(SrcB), .ALUControl(ALU_control), .ALUResult(ALU_out), .zero(Zero));

    sign_extend         sign_extend_DP(.offset(Instr1[15:0]),  .out(signIMM));

    assign PCscrc = Zero & branch;
    assign Write_Data = RD2_DP;
    assign reg_data = mux_D_M_result;
    
endmodule
