class ag_seq_item extends uvm_sequence_item;

    `uvm_object_utils(ag_seq_item)

    rand   bit A;
    rand   bit B;
           bit Y;

    function new(string name = "ag_seq_item");
            super.new(name);
    endfunction : new


endclass : ag_seq_item