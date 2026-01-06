class spi_m_agent extends uvm_agent;

    `uvm_component_utils(spi_m_agent)

    spi_m_driver    drv;
    spi_m_monitor   mon;
    spi_m_sequencer seqr;

    function new(string name = "spi_m_agent" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv =   spi_m_driver::type_id::create("drv" , this);
        mon =   spi_m_monitor::type_id::create("mon" , this);
        seqr    =   spi_m_sequencer::type_id::create("seqr" , this);
    endfunction : build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase

endclass : spi_m_agent