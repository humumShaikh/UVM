class spi_m_environment extends uvm_env;

    `uvm_component_utils(spi_m_environment)

    spi_m_agent         agent;
    spi_m_scoreboard    scb;

    function new(string name = "spi_m_environment" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent = spi_m_agent::type_id::create("agent" , this);
        scb = spi_m_scoreboard::type_id::create("scb" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent.mon.item_collected_port.connect(scb.item_collected_export);
    endfunction : connect_phase

endclass : spi_m_environment