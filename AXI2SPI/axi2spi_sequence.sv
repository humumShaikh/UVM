class axi2spi_sequence extends uvm_sequence #(axi2spi_seq_item);

    `uvm_object_utils(axi2spi_sequence)

    axi2spi_seq_item    A2S;

    function new(string name = "axi2spi_sequence");
        super.new(name);
        `uvm_info("Sequence Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new


    task body();
        repeat(4)
        begin
            A2S = axi2spi_seq_item::type_id::create("A2S");
            `uvm_do(A2S);
            `uvm_info("Sequence Class" , $sformatf("AWADDR : 0x%0h   WDATA : 0x%0h  WSTRB : 0x%0h", A2S.AWADDR , A2S.WDATA , A2S.WSTRB) , UVM_MEDIUM)
        end
    endtask : body

endclass : axi2spi_sequence