class ag_agent extends uvm_agent;

    `uvm_component_utils(ag_agent)

    ag_driver       drv;
    ag_monitor      mon;
    ag_sequencer    seqr;

    function new(string name = "ag_agent" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv     =   ag_driver::type_id::create("drv" , this);
        mon     =   ag_monitor::type_id::create("mon" , this);
        seqr    =   ag_sequencer::type_id::create("seqr" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase


endclass : ag_agent