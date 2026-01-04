class ha_monitor extends uvm_monitor;

    `uvm_component_utils(ha_monitor)

    uvm_analysis_port #(ha_seq_item) item_collected_port;

    ha_seq_item T;

    virtual ha_intf vif;

    function new(string name = "ha_monitor" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Monitor Class" , "Constructor" , UVM_MEDIUM)

        item_collected_port = new("item_collected_port" , this);
        T = new();
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Monitor Class" , "Build Phase" , UVM_MEDIUM)
        uvm_config_db#(virtual ha_intf)::get(this , "" , "vif" , vif);
    endfunction : build_phase

    
    task run_phase(uvm_phase phase);
        forever 
        begin
            @(posedge vif.clk);
            T.A = vif.A;
            T.B = vif.B;
            `uvm_info("Monitor Class" , $sformatf("A = %0b  B = %0b" , T.A , T.B ) , UVM_MEDIUM)
            @(posedge vif.clk);
            T.S = vif.S;
            T.C = vif.C;
            item_collected_port.write(T);
        end
    endtask : run_phase

endclass : ha_monitor