class xor_seq_item extends uvm_sequence_item;        //xor_seq_item extending from uvm_sequence_item, it's like the transaction class of SV

    `uvm_object_utils(xor_seq_item)                //UVM factory registration for this class

    rand    bit A;    
    rand    bit B;
            bit Y;

    function new(string name = "xor_seq_item");        //constructor for the xor_seq_item class
        super.new(name);                            //calling the base class constructor
        `uvm_info("Sequence Item Class" , "Constructor" , UVM_LOW)
    endfunction : new
    


endclass : xor_seq_item


