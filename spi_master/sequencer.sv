class spi_m_sequencer extends uvm_sequencer #(spi_m_seq_item);

    `uvm_component_utils(spi_m_sequencer);

    function new(string name = "spi_m_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
endclass: spi_m_sequencer
