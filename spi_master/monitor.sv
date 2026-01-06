class spi_m_monitor extends uvm_monitor;

    `uvm_component_utils(spi_m_monitor)

    virtual SPI_INTF vif;

    uvm_analysis_port #(spi_m_seq_item) item_collected_port;

    spi_m_seq_item  I;

    function new(string name = "spi_m_monitor" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        item_collected_port = new("item_collected_port" , this);
        uvm_config_db#(virtual SPI_INTF)::get(this, "", "vif", vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        forever
        begin
            I = spi_m_seq_item::type_id::create("I");
            sampleTransaction(I);
            item_collected_port.write(I);
        end
    endtask : run_phase


    task sampleTransaction(ref spi_m_seq_item I);
        begin
            @(negedge vif.ss);
                I.din = vif.din;
                
            for(int i = 7; i >= 0; i--)
            begin
                @(posedge vif.sclk);
                    #1ns;
                    I.dout[i] = vif.mosi;
            end
        end
    endtask : sampleTransaction




endclass : spi_m_monitor