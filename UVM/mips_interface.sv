interface mips_interface(input bit clk);

    logic [31:0] uvm_inst;
    logic uvm_mux_sel;
    bit  rst;
    logic [31:0] reg_data;	//register file data
    logic [31:0] mem_data;	//data memory data
    logic [31:0] pc_current;
    logic [31:0] pc_next;

endinterface
