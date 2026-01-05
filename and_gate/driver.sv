class ag_driver extends uvm_driver #(ag_seq_item);

    `uvm_component_utils(ag_driver)

    virtual AND_INTF vif;

    ag_seq_item I;

    function new(string name = "ag_driver" , uvm_component parent);
        super.new(name , parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        uvm_config_db#(virtual AND_INTF)::get(this, "", "vif", vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        //repeat(4)
        forever
        begin
            I = ag_seq_item::type_id::create("I");
            seq_item_port.get_next_item(I);

            @(posedge vif.clk);
            vif.A <= I.A;
            vif.B <= I.B;

            seq_item_port.item_done();
        end
    endtask : run_phase

endclass : ag_driver