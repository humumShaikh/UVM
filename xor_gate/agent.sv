class xor_agent extends uvm_agent;                    //class xor_agent is derived from the uvm base class of uvm_agent

    `uvm_component_utils(xor_agent)                    //factory registeration of xor_agent

    xor_driver      drv;                                //creating a handle of the xor_driver and assigning it the handle drv
    xor_monitor     mon;
    xor_sequencer   seqr;

    function new(string name = "xor_agent" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Agent Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Agent Class" , "Build Phase" , UVM_LOW)

        drv = xor_driver::type_id::create("drv" , this);
        mon = xor_monitor::type_id::create("mon" , this);
        seqr = xor_sequencer::type_id::create("seqr" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("Agent Class" , "Connect Phase" , UVM_LOW)

        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase


endclass : xor_agent

