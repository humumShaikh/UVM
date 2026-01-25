class xor_monitor extends uvm_monitor;                                        //extending the xor_monitor class or deriving it from the parent class of uvm_monitor

    `uvm_component_utils(xor_monitor)                                            //registering this class xor_monitor in the uvm factory

    virtual XOR_INTF vif;                                                        //creating a virtual handle to the xor_intf and calling it as vif

    xor_seq_item    I;                                                            //creating a handle named 'I' of the xor_seq_item class

    uvm_analysis_port #(xor_seq_item) item_collected_port;                        //creating a handle to UVM TLM port and calling it as item_collected_port 

    function new(string name = "xor_monitor" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Monitor Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Monitor Class" , "Build Phase" , UVM_LOW)

        item_collected_port = new("item_collected_port" , this);
        uvm_config_db #(virtual XOR_INTF)::get(this , "" , "vif" , vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        forever
        begin
            @(posedge vif.clk);
            #1ns;
            `uvm_info("Monitor Class" , "Run Phase" , UVM_LOW)
            I = xor_seq_item::type_id::create("I");
            I.A = vif.A;
            I.B = vif.B;
            I.Y = vif.Y;
            item_collected_port.write(I);
        end
    endtask : run_phase


endclass : xor_monitor




