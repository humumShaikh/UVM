class ha_sequencer extends uvm_sequencer #(ha_seq_item);

    `uvm_component_utils(ha_sequencer)
    
    function new(string name = "ha_sequencer" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Sequencer Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Sequencer Class" , "Build Phase" , UVM_MEDIUM)
    endfunction : build_phase

endclass : ha_sequencer