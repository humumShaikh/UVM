class ha_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(ha_scoreboard)

    uvm_analysis_imp#(ha_seq_item , ha_scoreboard) item_collected_export;

    ha_seq_item ha_seq_item_q[$];

    function new(string name = "ha_scoreboard" , uvm_component parent);
        super.new(name , parent);
        `uvm_info(get_type_name , "Constructor" , UVM_MEDIUM)

        item_collected_export = new("item_collected_export" , this);
    endfunction : new


    function void write(ha_seq_item T);
        ha_seq_item_q.push_back(T);
    endfunction : write


    task run_phase(uvm_phase phase);
        ha_seq_item I;
        
        forever
        begin
            wait(ha_seq_item_q.size() > 0);

            if(ha_seq_item_q.size() > 0)
            begin
                I = ha_seq_item_q.pop_front();
                $display("---------------------------------------------------------------------------------------------------------------");
                if(((I.A ^ I.B) == I.S)   &&  ((I.A & I.B) == I.C))
                    `uvm_info("Scoreboard Class" , $sformatf("^^^^^^TEST PASSED^^^^^^   A = %0b B = %0b S = %0b C = %0b" , I.A , I.B , I.S , I.C) , UVM_MEDIUM)
                else
                    `uvm_info("Scoreboard Class" , $sformatf("!!!!!!TEST FAILED!!!!!!   A = %0b B = %0b S = %0b C = %0b" , I.A , I.B , I.S , I.C) , UVM_MEDIUM)
                $display("---------------------------------------------------------------------------------------------------------------");
            end
        end
    endtask : run_phase




endclass : ha_scoreboard