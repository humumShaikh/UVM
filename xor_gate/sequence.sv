class xor_sequence extends uvm_sequence #(xor_seq_item);                //xor_sequence class derived from uvm_sequence class and taking as arguement an object of xor_seq_item

    `uvm_object_utils(xor_sequence)                                //uvm factory registration of the xor_sequence class

    xor_seq_item    I;                                        //creating a handle of the xor_seq_item called as 'I'

    function new(string name = "xor_sequence");                //constructor for the xor_sequence class
        super.new();                                        //calling the base class constructor
        `uvm_info("Sequence Class" , "Constructor" , UVM_LOW)
    endfunction : new


    task body();                                                //main task of the sequence class
        repeat(8)
        begin
            I = xor_seq_item::type_id::create("I");
            `uvm_do(I)
        end
    endtask : body



endclass : xor_sequence




