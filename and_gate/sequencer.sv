class ag_sequencer extends uvm_sequencer #(ag_seq_item);

    `uvm_component_utils(ag_sequencer)
    
    function new(string name = "ag_sequencer" , uvm_component parent);
        super.new(name , parent);
    endfunction : new

endclass : ag_sequencer