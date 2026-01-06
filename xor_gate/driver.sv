class xor_driver extends uvm_driver #(xor_seq_item);

    `uvm_component_utils(xor_driver)

    virtual XOR_INTF vif;

    xor_seq_item    I;

    function new(string name = "xor_driver" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Driver Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Driver Class" , "Build Phase" , UVM_LOW)

        uvm_config_db #(virtual XOR_INTF)::get(this , "" , "vif" , vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        forever
        begin
            @(posedge vif.clk);
            `uvm_info("Driver Class" , "Run Phase" , UVM_LOW)
            I = xor_seq_item::type_id::create("I");
            seq_item_port.get_next_item(I);
            vif.A <= I.A;
            vif.B <= I.B;
            seq_item_port.item_done();
        end
    endtask : run_phase

endclass : xor_driver