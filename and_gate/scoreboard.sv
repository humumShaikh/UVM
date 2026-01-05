class ag_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(ag_scoreboard)

    ag_seq_item I;

    ag_seq_item ag_seq_item_q[$];

    uvm_analysis_imp #(ag_seq_item , ag_scoreboard) item_collected_export;

    function new(string name = "ag_scoreboard" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        item_collected_export = new("item_collected_export" , this);
    endfunction : build_phase


    function void write(ag_seq_item I);
        ag_seq_item_q.push_back(I);
    endfunction : write


    task run_phase(uvm_phase phase);
        forever
        begin
            wait(ag_seq_item_q.size() > 0);

            I = ag_seq_item::type_id::create("I");
            
            I = ag_seq_item_q.pop_front();

            if((I.A & I.B) == I.Y) `uvm_info("Scoreboard" , $sformatf("TEST PASSED : A = %0b    B = %0b     Y = %0b", I.A , I.B , I.Y) , UVM_MEDIUM)
            else                   `uvm_info("Scoreboard" , $sformatf("TEST FAILED : A = %0b    B = %0b     Y = %0b", I.A , I.B , I.Y) , UVM_MEDIUM)

        end
    endtask : run_phase

endclass : ag_scoreboard