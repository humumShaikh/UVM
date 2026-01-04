class ha_environment extends uvm_env;

    `uvm_component_utils(ha_environment)

    ha_agent        agent;
    ha_scoreboard   scb;

    function new(string name = "ha_environment" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Environment Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Environment Class" , "Build Phase" , UVM_MEDIUM)

        agent = ha_agent::type_id::create("agent" , this);
        scb = ha_scoreboard::type_id::create("scb" , this);
    endfunction : build_phase

    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("Environment Class" , "Connect Phase" , UVM_MEDIUM)

        agent.mon.item_collected_port.connect(scb.item_collected_export);
    endfunction : connect_phase

endclass : ha_environment