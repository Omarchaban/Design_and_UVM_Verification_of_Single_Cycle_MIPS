class mips_agent extends uvm_agent;


`uvm_component_utils(mips_agent);

mips_monitor monitor;
mips_sequencer sequencer;
mips_driver driver;


function new(string name="mips_agent",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of  agent  class",UVM_LOW);
endfunction

/*Build phase of the agent*/
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of agent class",UVM_LOW);
	monitor = mips_monitor::type_id::create("monitor",this);
	driver = mips_driver::type_id::create("driver",this);
	sequencer = mips_sequencer::type_id::create("sequencer",this);


endfunction

/*Connect phase of agent*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of  agent  class",UVM_LOW);
	driver.seq_item_port.connect(sequencer.seq_item_export);

endfunction



/*Run phase of agent*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of  agent  class",UVM_LOW);
endtask
endclass
