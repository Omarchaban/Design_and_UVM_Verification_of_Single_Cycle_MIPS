`timescale 1ns/1ps
import uvm_pkg::*;
`include "uvm_macros.svh"
`include"mips_interface.sv"


`include"mips_seq_item.sv"
`include"mips_seq.sv"
`include"mips_sequencer.sv"
`include"mips_driver.sv"
`include"mips_monitor.sv"
`include"mips_agent.sv"
`include"mips_scoreboard.sv"
`include"mips_env.sv"

`include"mips_test.sv"



module mips_uvm_top();


bit clk;
mips_interface intf(clk);



always begin
	clk = ~clk; #20;
end

MIPS_top dut (.uvm_inst(intf.uvm_inst),.clk(intf.clk),.reg_data(intf.reg_data),.rst(intf.rst),
		.uvm_mux_sel(intf.uvm_mux_sel),.Write_Data(intf.mem_data),.PC_input(intf.pc_current)
		,.Pc(intf.pc_next));
initial begin
uvm_config_db #(virtual mips_interface)::set(null, "*", "intf", intf);
    run_test("mips_test");

end

initial begin 
  
  #30000;
  
  
  
end










endmodule