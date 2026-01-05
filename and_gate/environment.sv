class ag_environment extends uvm_env;

    `uvm_component_utils(ag_environment)

    ag_agent        agent;
    ag_scoreboard   scb;

    function new(string name = "ag_environment" , uvm_component parent);
        super.new(name , parent);
    endfunction : new

    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent       =   ag_agent::type_id::create("agent" , this);
        scb         =   ag_scoreboard   ::type_id::create("scb" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent.mon.item_collected_port.connect(scb.item_collected_export);
    endfunction : connect_phase

endclass : ag_environment