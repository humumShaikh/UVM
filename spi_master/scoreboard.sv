class spi_m_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(spi_m_scoreboard)

    uvm_analysis_imp #(spi_m_seq_item , spi_m_scoreboard) item_collected_export;

    spi_m_seq_item  spi_m_seq_item_q[$];

    spi_m_seq_item  I;

    function new(string name = "spi_m_scoreboard" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        item_collected_export = new("item_collected_export" , this);
    endfunction : build_phase

    function void write(spi_m_seq_item I);
        spi_m_seq_item_q.push_back(I);
    endfunction : write


    task run_phase(uvm_phase phase);
        `uvm_info("Scoreboard Class" , "Run Phase" , UVM_MEDIUM)
        forever
        begin
            wait(spi_m_seq_item_q.size() > 0)

            I = spi_m_seq_item::type_id::create("I");

            I = spi_m_seq_item_q.pop_front();

            if(I.dout == I.din)
                `uvm_info("Scoreboard Class" , $sformatf("TEST PASSED : DATA SENT = 0x%0h   DATA RECEIVED  = 0x%0h" , I.din , I.dout) , UVM_MEDIUM)
            else
                `uvm_info("Scoreboard Class" , $sformatf("TEST FAILED : DATA SENT = 0x%0h   DATA RECEIVED  = 0x%0h" , I.din , I.dout) , UVM_MEDIUM)

        end
    endtask : run_phase

endclass : spi_m_scoreboard