class ag_monitor extends uvm_monitor;

    `uvm_component_utils(ag_monitor)

    virtual AND_INTF vif;

    ag_seq_item I;

    uvm_analysis_port #(ag_seq_item) item_collected_port;


    function new(string name = "ag_monitor" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        item_collected_port = new("item_collected_port" , this);
        uvm_config_db#(virtual AND_INTF)::get(this, "", "vif", vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        //repeat(4)
        forever
        begin
            @(posedge vif.clk);
            I = ag_seq_item::type_id::create("I");
            I.A = vif.A;
            I.B = vif.B;
            I.Y = vif.Y;
            item_collected_port.write(I);
        end
    endtask : run_phase


endclass : ag_monitor