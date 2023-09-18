class mips_sequencer extends uvm_sequencer #(mips_seq_item);
`uvm_component_utils(mips_sequencer);

function new(string name="mips_sequencer",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of sequencer class",UVM_LOW);


endfunction




/* Build  phase of sequencer */
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of sequencer class",UVM_LOW);
endfunction

/*Connect phase of sequencer*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of sequencer class",UVM_LOW);
endfunction



/*Run phase of sequencer*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of sequencer class",UVM_LOW);

endtask









endclass
