class xor_seq_item extends uvm_sequence_item;

    `uvm_object_utils(xor_seq_item)

    rand    bit A;
    rand    bit B;
            bit Y;

    function new(string name = "xor_seq_item");
        super.new(name);
        `uvm_info("Sequence Item Class" , "Constructor" , UVM_LOW)
    endfunction : new
    

endclass : xor_seq_item