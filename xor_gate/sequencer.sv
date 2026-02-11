class xor_sequencer extends uvm_sequencer #(xor_seq_item);        //deriving the xor_sequencer class from the uvm_sequencer base class

    `uvm_component_utils(xor_sequencer)                        //factory registration of the xor_sequencer class

    function new(string name = "xor_sequencer" , uvm_component parent);        //constructor for xor_sequencer class
        super.new(name , parent);
        `uvm_info("Sequencer Class" , "Constructor" , UVM_LOW)
    endfunction : new
    


endclass : xor_sequencer


