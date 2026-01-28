class xor_scoreboard extends uvm_scoreboard;                                        //extending / deriving the xor_scoreboard class from the parent class of uvm_scoreboard

    `uvm_component_utils(xor_scoreboard)                                            //factory registration of xor_scoreboard class

    uvm_analysis_imp #(xor_seq_item , xor_scoreboard) item_collected_export;        //creating a handle for the uvm_analysis_imp (port) for receiving transaction (sequence item) from monitor

    xor_seq_item    xor_seq_item_q[$];                                                //creating a queue for storing the incoming sequence items

    xor_seq_item    I;                                                                //creating a sequence item handle and calling it as 'I'

    function new(string name = "xor_scoreboard" , uvm_component parent);                //constructor for xor_scoreboard class
        super.new(name , parent);                                                    //constructor of xor_scoreboard class
        `uvm_info("Scoreboard Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Scoreboard Class" , "Build Phase" , UVM_LOW)

        item_collected_export = new("item_collected_export" , this);
    endfunction : build_phase

    function void write(xor_seq_item I);
        xor_seq_item_q.push_back(I);
    endfunction : write


    task run_phase(uvm_phase phase);
        forever
        begin
            wait(xor_seq_item_q.size() > 0);

            I = xor_seq_item::type_id::create("I");
            I = xor_seq_item_q.pop_front();
            
            $display("----------------------------------------------------------------------------------");
            if((I.A ^ I.B) == I.Y)
                `uvm_info("Scoreboard Class" , $sformatf("TEST PASSED : A = %0b B = %0b  Y = %0b", I.A , I.B , I.Y) , UVM_LOW)
            else
                `uvm_info("Scoreboard Class" , $sformatf("TEST FAILED : A = %0b B = %0b  Y = %0b", I.A , I.B , I.Y) , UVM_LOW)
            $display("----------------------------------------------------------------------------------");
        end
    endtask : run_phase



endclass : xor_scoreboard






