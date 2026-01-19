//The agent is a construct for initiating the driver , monitor and sequencer

class spi_m_agent extends uvm_agent;        

    `uvm_component_utils(spi_m_agent)                                //registering the spi_m_agent in the utils

    spi_m_driver    drv;                                            //creating an object drv of class spi_m_driver
    spi_m_monitor   mon;                                            //creating an object mon of class spi_m_monitor
    spi_m_sequencer seqr;                                           //creating an object seqr of class spi_m_sequencer 

    function new(string name = "spi_m_agent" , uvm_component parent);        //constructor
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


