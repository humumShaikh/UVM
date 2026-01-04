class ha_seq_item extends uvm_sequence_item;    

    randc   bit A;
    randc   bit B;
            bit S;
            bit C;
    
    function new(string name = "ha_seq_item");
        super.new(name);
        `uvm_info("Sequence Item Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new

    `uvm_object_utils_begin(ha_seq_item)
        `uvm_field_int(A , UVM_DEFAULT)
        `uvm_field_int(B , UVM_DEFAULT)
    `uvm_object_utils_end

        

endclass : ha_seq_item