//----------------------------------------------------------------
// AutoGenerated blockA srm regblock.
//----------------------------------------------------------------

`ifndef INCLUDED_blockA_srm_model_svh
`define INCLUDED_blockA_srm_model_svh
//------------------------------------------------------
// Regblock blockA 
//------------------------------------------------------
class BlockA extends srm_node;
  //------------------------------------------------------
  // Register r1 
  //------------------------------------------------------
  typedef struct packed {
    reg[31:0] field0;
  } r1_struct_t; 

  // Constraint Class
  class r1_constr extends uvm_object; 
     `uvm_object_utils(r1_constr) 

     rand bit[31:0] field0; 
 
     function new(string name="r1_constr"); 
       super.new(name); 
     endfunction 

     function r1_struct_t get_data(); 
       r1_struct_t d; 
       d.field0 = field0;
 
     endfunction
  endclass: r1_constr

  class r1_reg extends srm_reg#(r1_struct_t);
    srm_field#(bit[31:0]) field0;
    
    function new(string name, srm_node parent);
      super.new(name, parent);
      set_reset_kind("hard_reset"); 
      field0 = new(.name("field0"), .parent(this), .n_bits(32), .lsb_pos(0), .volatile(0)); 
      add_field(field0);
      field0.set_reset_value(.kind("hard_reset"), .value(32'h0)); 
    endfunction: new

  endclass: r1_reg

  r1_reg r1_reg_inst;
  function new(string name, srm_node parent);
    super.new(name, parent);
    r1_reg_inst = new(.name("r1_reg_inst"), .parent(this));
    add_child(r1_reg_inst);
    r1_reg_inst.set_offset("default", .offset('h0000_1000));
  endfunction
  
endclass: BlockA

`endif
