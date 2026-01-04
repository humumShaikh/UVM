class ha_driver extends uvm_driver #(ha_seq_item);

    `uvm_component_utils(ha_driver)

    virtual ha_intf vif;

    ha_seq_item T;

    function new(string name = "ha_driver" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Driver Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Driver Class" , "Build Phase" , UVM_MEDIUM)
        uvm_config_db#(virtual ha_intf)::get(this , "" , "vif" , vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        forever
        begin
            seq_item_port.get_next_item(T);
            `uvm_info("Driver Class" , $sformatf("A = %0b B = %0b", T.A , T.B) , UVM_MEDIUM)
            vif.A <= T.A;
            vif.B <= T.B;
            seq_item_port.item_done();
        end
    endtask : run_phase

endclass : ha_driver