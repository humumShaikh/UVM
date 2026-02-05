class axi2spi_sequencer extends uvm_sequencer #(axi2spi_seq_item);

    `uvm_component_utils(axi2spi_sequencer)
    
    function new(string name = "axi2spi_sequencer" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Sequencer Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new

    

endclass : axi2spi_sequencer