class spi_m_driver extends uvm_driver #(spi_m_seq_item);

    `uvm_component_utils(spi_m_driver);

    virtual SPI_INTF vif;

    spi_m_seq_item  I;
       
    function new(string name = "spi_m_driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(virtual SPI_INTF)::get(null, "", "vif", vif);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        forever
        begin
            I = spi_m_seq_item::type_id::create("I");
            seq_item_port.get_next_item(I);
            initComm(I);
            seq_item_port.item_done();
        end
    endtask : run_phase




    task initComm(spi_m_seq_item I);
        @(posedge vif.clk);
            vif.start <= 1'b1;
            vif.reset <= 1'b0;
            vif.din <= I.din;

        @(posedge vif.clk);
            vif.start <= 1'b0;

        repeat(8)
        begin
            @(posedge vif.clk);
        end

        @(posedge vif.clk);
    endtask : initComm

    
endclass: spi_m_driver
