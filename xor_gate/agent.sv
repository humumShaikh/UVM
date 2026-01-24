class xor_agent extends uvm_agent;                    //class xor_agent is derived from the uvm base class of uvm_agent

    `uvm_component_utils(xor_agent)                    //factory registeration of xor_agent

    xor_driver      drv;                                //creating a handle of the xor_driver named as drv
    xor_monitor     mon;                                //creating a handle of the xor_monitor named as mon
    xor_sequencer   seqr;                                //creating a handle of the xor_sequencer named as seqr

    function new(string name = "xor_agent" , uvm_component parent);        //constructor
        super.new(name , parent);                                            //calling the base class constructor
        `uvm_info("Agent Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);                                //build phase function
        super.build_phase(phase);                                                //calling the build_phase function of the parent class 
        `uvm_info("Agent Class" , "Build Phase" , UVM_LOW)

        drv = xor_driver::type_id::create("drv" , this);                            //creating an object of driver class
        mon = xor_monitor::type_id::create("mon" , this);                            //creating an object of monitor class 
        seqr = xor_sequencer::type_id::create("seqr" , this);                        //creating an object of sequencer class
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("Agent Class" , "Connect Phase" , UVM_LOW)

        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase


endclass : xor_agent








