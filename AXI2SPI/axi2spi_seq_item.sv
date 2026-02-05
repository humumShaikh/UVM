class axi2spi_seq_item extends uvm_sequence_item;

    `uvm_object_utils(axi2spi_seq_item)

    rand    bit [07:00] AWADDR;

    rand    bit [31:00] WDATA;
    rand    bit [03:00] WSTRB;

    constraint writeAddress
    {
        AWADDR inside {8'h00 , 8'h02 , 8'h04 , 8'h06 , 8'h08 , 8'h0A , 8'h0C , 8'h0E};
    }
    
    function new(string name = "axi2spi_seq_item");
        super.new(name);
        `uvm_info("Sequence Item" , "Constructor" , UVM_MEDIUM)
    endfunction : new


endclass : axi2spi_seq_item
