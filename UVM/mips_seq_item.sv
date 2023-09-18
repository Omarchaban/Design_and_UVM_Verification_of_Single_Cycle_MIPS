class mips_seq_item extends uvm_sequence_item;
`uvm_object_utils(mips_seq_item);

    rand logic [31:0] uvm_inst;
    rand logic uvm_mux_sel;
    randc logic rst;
    rand logic [5:0] opcode;
    rand logic [5:0] func;
    rand logic [4:0] rd;
    rand logic [4:0] rs;
    rand logic [4:0] rt;
    rand logic [15:0] imm;
    rand logic [25:0] jta;
    logic [31:0] reg_data;	//register file data
    logic [31:0] mem_data;	//data memory data
    logic [31:0] pc_current;	
    logic [31:0] pc_next;	

constraint op_const { opcode inside {0,2,4,8,35,43};} // r,jump , beq ,addi,lw,sw
constraint rd_const {rd inside {[2:25]};}
constraint rs_const {rs inside {[2:25]};}
constraint rt_const {rt inside {[2:25]};}
constraint gt {rs >rt;}
constraint imm_const {imm inside {[4:2**16-1]};}
constraint jta_const {jta inside {[4:2**26-1]};}
constraint R_type { func inside{32,34,42,28};} //add,sub,lt,multiply

constraint imm_lw {(opcode == 35) -> imm inside{ [0 : 2**8-1]};}
constraint imm_sw_addi {(opcode inside{ 8,43}) -> imm inside{ [0 : 2**5-1]};}
constraint inst{
      (opcode == 0) -> uvm_inst == {opcode, rs, rt, rd, 5'b00000, func};
      (opcode == 2) -> uvm_inst == {opcode, jta};
      (opcode inside {4,8, 35, 43}) -> uvm_inst =={opcode, rs, rt, imm[15:0]};
	
    }



function new(string name="mips_seq_item");
	super.new(name);
	`uvm_info(get_type_name() , "inside new of sequence item",UVM_LOW);
endfunction





endclass
