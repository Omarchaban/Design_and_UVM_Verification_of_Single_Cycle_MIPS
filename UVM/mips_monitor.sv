class mips_monitor extends uvm_monitor;

`uvm_component_utils(mips_monitor);

mips_seq_item item;

virtual mips_interface intf;


uvm_analysis_port #(mips_seq_item) monitor_port;

function new(string name="mips_monitor",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of  monitor  class",UVM_LOW);
	endfunction




/* Build  phase of monitor */
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of monitor class",UVM_LOW);
	monitor_port = new("monitor_port",this);


endfunction

/*Connect phase of monitor*/
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of  monitor  class",UVM_LOW);
	if(!(uvm_config_db #(virtual mips_interface) ::get(this,"*","intf",intf)))
       		`uvm_error("driver class","failed to get virtual interface");
endfunction



/*Run phase of monitor*/
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_type_name() , "inside run_phase of  monitor  class",UVM_LOW);
	forever begin
		item = mips_seq_item::type_id::create("item");
		
		
		@(posedge intf.clk);
			item.uvm_inst = intf.uvm_inst ;
			item.uvm_mux_sel =intf.uvm_mux_sel;
			item.rst =intf.rst;
		
			
			item.reg_data = intf.reg_data;
			item.mem_data = intf.mem_data;
			item.pc_current =intf.pc_current;
			item.pc_next = intf.pc_next;
			monitor_port.write(item);
		
		@(negedge intf.clk);
		
		
	end

endtask



endclass
