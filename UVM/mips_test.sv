class mips_test extends uvm_test;

`uvm_component_utils(mips_test);

mips_env env;

Base_seq rst;
Data_seq data;


function new(string name="mips_test",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of test class",UVM_LOW);


endfunction




/* Build  phase of test */
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of test class",UVM_LOW);
	env = mips_env::type_id::create("env",this);
endfunction

/*Connect phase of test*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of test class",UVM_LOW);
endfunction



/*Run phase of test*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of test class",UVM_LOW);
	phase.raise_objection(this);
	rst = Base_seq::type_id::create("rst");
	rst.start(env.agent.sequencer);
	#40;
	repeat(100) begin
		data = Data_seq::type_id::create("data");
		data.start(env.agent.sequencer);
		#40;
	end
	phase.drop_objection(this);



endtask





endclass
