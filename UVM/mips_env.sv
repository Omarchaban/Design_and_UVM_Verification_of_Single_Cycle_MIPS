class mips_env extends uvm_env;

	
	mips_agent agent;
	mips_scoreboard scoreboard;
`uvm_component_utils(mips_env)
function new(string name="mips_env",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of env class",UVM_LOW);


endfunction




/* Build  phase of env */
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of env class",UVM_LOW);
	agent = mips_agent::type_id::create("agent",this);
	scoreboard = mips_scoreboard::type_id::create("scoreboard",this);
endfunction

/*Connect phase of env*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of env class",UVM_LOW);
	agent.monitor.monitor_port.connect(scoreboard.scoreboard_port);
endfunction



/*Run phase of env*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of env class",UVM_LOW);

endtask




endclass
