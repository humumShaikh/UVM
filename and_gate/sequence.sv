class ag_sequence extends uvm_sequence #(ag_seq_item);

    `uvm_object_utils(ag_sequence)

    ag_seq_item T;

    function new(string name = "ag_sequence");
        super.new(name);
    endfunction : new


    task body();
        repeat(8)
        begin
            T = ag_seq_item::type_id::create("T");
            `uvm_do(T);
        end
    endtask : body

endclass : ag_sequence