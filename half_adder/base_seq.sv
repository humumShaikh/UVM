class ha_base_seq extends uvm_sequence #(ha_seq_item);

    `uvm_object_utils(ha_base_seq)

    ha_seq_item T;

    function new(string name = "ha_base_seq");
        super.new(name);
        `uvm_info("Sequence Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new

    task body();
        `uvm_info("Sequence Class" , "Task  Body" , UVM_MEDIUM)
        `uvm_do(T);
    endtask : body

endclass : ha_base_seq