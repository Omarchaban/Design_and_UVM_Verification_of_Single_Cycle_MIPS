class mips_driver extends uvm_driver #(mips_seq_item);

`uvm_component_utils(mips_driver);

mips_seq_item item;

virtual mips_interface intf;

function new(string name="mips_driver",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of  driver  class",UVM_LOW);


endfunction




/* Build  phase of driver */
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of driver class",UVM_LOW);
endfunction

/*Connect phase of driver*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of  driver  class",UVM_LOW);
	if(!(uvm_config_db #(virtual mips_interface) ::get(this,"*","intf",intf)))
       		`uvm_error("driver class","failed to get virtual interface");
endfunction



/*Run phase of driver*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of  driver  class",UVM_LOW);
	forever begin
		item = mips_seq_item::type_id::create("item");
		seq_item_port.get_next_item(item);
		drive(item);
		seq_item_port.item_done();
	end

endtask
/*drive task inside driver*/
task drive(mips_seq_item item);

	@(posedge intf.clk);
		intf.uvm_inst = item.uvm_inst;
		intf.uvm_mux_sel =item.uvm_mux_sel;
		intf.rst = item.rst;
	

endtask




endclass
