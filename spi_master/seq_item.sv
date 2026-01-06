class spi_m_seq_item extends uvm_sequence_item;

    `uvm_object_utils(spi_m_seq_item)
    
    rand    bit [7:0]   din;
            bit [7:0]   dout;

    function new(string name = "spi_m_seq_item");
        super.new(name);
    endfunction : new

endclass : spi_m_seq_item