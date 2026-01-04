class ha_agent extends uvm_agent;

    `uvm_component_utils(ha_agent)

    ha_driver       drv;
    ha_monitor      mon;
    ha_sequencer    seqr;

    function new(string name = "ha_agent" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Agent Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Agent Class" , "Build Phase" , UVM_MEDIUM)

        drv = ha_driver::type_id::create("drv" , this);
        mon = ha_monitor::type_id::create("mon" , this);
        seqr = ha_sequencer::type_id::create("seqr" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("Agent Class" , "Connect Phase" , UVM_MEDIUM)

        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase

endclass : ha_agent