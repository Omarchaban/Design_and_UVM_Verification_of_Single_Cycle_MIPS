class Base_seq extends uvm_sequence #(mips_seq_item);
`uvm_object_utils(Base_seq);

mips_seq_item Rst_pkt;

function new(string name = "Base_seq");

	super.new(name);
	`uvm_info(get_type_name() , "inside new of sequence class",UVM_LOW);



endfunction

task body;

	Rst_pkt=mips_seq_item::type_id::create("Rst_pkt");
	start_item(Rst_pkt);
	if(!(Rst_pkt.randomize() with {rst ==0;})) begin
		`uvm_error(get_type_name() ,"error rst packet");
	end
	else begin
		`uvm_info(get_type_name() , "rst packet randomization success",UVM_LOW);
	end
	finish_item(Rst_pkt);



endtask





endclass

class Data_seq extends Base_seq;

`uvm_object_utils(Data_seq);
mips_seq_item Data_pkt;

function new(string name = "Base_seq");

	super.new(name);
	`uvm_info(get_type_name() , "inside new of sequence class",UVM_LOW);



endfunction

task body;

	Data_pkt=mips_seq_item::type_id::create("Data_pkt");
	start_item(Data_pkt);
	if(!(Data_pkt.randomize() with {rst ==1 ; uvm_mux_sel ==1;})) begin
		`uvm_error(get_type_name() ,"error data packet");
	end
	else begin
		`uvm_info(get_type_name() , "data packet randomization success",UVM_LOW);		
		
	end
	finish_item(Data_pkt);



endtask







endclass