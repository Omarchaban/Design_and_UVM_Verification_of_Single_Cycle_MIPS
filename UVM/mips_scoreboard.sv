	class mips_scoreboard extends uvm_scoreboard ;


mips_seq_item items[$];


    logic [31:0] uvm_inst;
    logic uvm_mux_sel;
   
    logic[5:0] opcode;
    logic[5:0] func;
    logic [4:0] rd;
    logic [4:0] rs;
    logic [4:0] rt;
    logic [15:0] imm;
    logic [4:0] shamt;
    logic [25:0] jta;
    logic [31:0] reg_data;	//register file data
    logic [31:0] mem_data;	//data memory data

    logic [31:0] reg_mem [31:0];

    logic [31:0] data_mem [255:0];
`uvm_component_utils(mips_scoreboard);

uvm_analysis_imp #(mips_seq_item, mips_scoreboard) scoreboard_port;


function new(string name="mips_scoreboard",uvm_component parent);

	super.new(name,parent);
	`uvm_info(get_type_name() , "inside new of sequencer class",UVM_LOW);
	

endfunction

/* Build  phase of scoreboard */
function void build_phase(uvm_phase phase);

	super.build_phase(phase);
	`uvm_info(get_type_name() , "inside build_phase of scoreboard class",UVM_LOW);
	scoreboard_port = new("scoreboard_port",this);	
	foreach(reg_mem[i]) begin
		reg_mem[i] =i;
	end
	foreach (data_mem[i] ) begin
		data_mem[i] =i;
	end
endfunction


/*Connect phase of scoreboard*/
function void connect_phase(uvm_phase phase);

	super.connect_phase(phase);
	`uvm_info(get_type_name() , "inside connect_phase of  scoreboard  class",UVM_LOW);
	
endfunction


function write(mips_seq_item item);

	items.push_back(item);

endfunction


task run_phase(uvm_phase phase);
	logic signed [31:0] result;
	logic [31:0] pc_temp;
	logic [31:0] addr_temp;
	mips_seq_item item;
	
	//item = mips_seq_item::type_id::create("item");
	forever begin
		
		
		wait(items.size());
		
		item = items.pop_front();
		if(item.rst) begin
			case(item.uvm_inst[31:26])
				'd0: begin
					
					
					rs=item.uvm_inst[25:21];
               				rt=item.uvm_inst[20:16];                
               				rd=item.uvm_inst[15:11];
               				shamt=item.uvm_inst[10:6];
                			func=item.uvm_inst[5:0];
					
					case(func)
						32:result = reg_mem[rs] + reg_mem[rt];
						34:result =reg_mem[rs]-reg_mem[rt] ;
						42:result = (reg_mem[rs] < reg_mem[rt])?1:0;
						28:result = reg_mem[rs] * reg_mem[rt];
					endcase
					reg_mem[rd] =result;
					
					if(result == item.reg_data) begin
						`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else begin
						`uvm_error(get_type_name(),"ERROR OP 0 Test Failed");
						
						
					end
				end
				'd2: begin
					
					jta = item.uvm_inst[25:0];
					pc_temp = item.pc_current +4;
					result = {pc_temp[31:28],jta,2'b00};
					if(result == item.pc_next)  begin
						`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else begin
						`uvm_error(get_type_name(),"ERROR OP 2 Test Failed");
						
					end
				end
				'd4: begin
					
					imm =item.uvm_inst[15:0];
                			rt=item.uvm_inst[20:16];
                			rs=item.uvm_inst[25:21]; 
                			if(reg_mem[rs]==reg_mem[rt]) begin                
                				result = item.pc_current + 4 + ({{16{imm[15]}},imm}<<2);
                			end         
               			        else begin
              					 result = item.pc_current + 4;
                			end
              			        if(result==item.pc_next) begin
                  				`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else  begin
						`uvm_error(get_type_name(),"ERROR OP 4 Test Failed");
					end
				end
				'd8: begin
					
					imm =item.uvm_inst[15:0];
                			rt=item.uvm_inst[20:16];
                			rs=item.uvm_inst[25:21]; 
                			reg_mem[rt] = reg_mem[rs] + {{16{imm[15]}},imm};
					if(reg_mem[rt] == item.reg_data) begin
						`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else begin
						`uvm_error(get_type_name(),"ERROR OP 8 Test Failed");
						
					end
				end
				'd35: begin
					
				        imm =item.uvm_inst[15:0];
               				rt=item.uvm_inst[20:16];
                			rs=item.uvm_inst[25:21];
                			addr_temp=reg_mem[rs]+{{16{imm[15]}},imm};
               				reg_mem[rt]=data_mem[addr_temp];
                		
                			if(reg_mem[rt]==item.reg_data) begin
                   				`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else begin
                   				`uvm_error(get_type_name(),"ERROR OP 35 Test Failed");
						
                  			end
				end
				'd43: begin
					
					imm =item.uvm_inst[15:0];
               				rt=item.uvm_inst[20:16];
                			rs=item.uvm_inst[25:21];
                			addr_temp=reg_mem[rs]+{{16{imm[15]}},imm};
               				data_mem[addr_temp]=reg_mem[rt];
                
                			if(data_mem[addr_temp]==item.mem_data) begin
                   				`uvm_info(get_type_name(),"Test pass",UVM_LOW);
					end
					else begin
                   				`uvm_error(get_type_name(),"ERROR OP 43 Test Failed");
                  			end
				end

			endcase
		end

	end

endtask



endclass
