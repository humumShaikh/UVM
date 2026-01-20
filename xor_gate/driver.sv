class xor_driver extends uvm_driver #(xor_seq_item);                //class xor_driver extends from the UVM base class of uvm_driver

    `uvm_component_utils(xor_driver)                                //registering this derived class in the UVM Factory

    virtual XOR_INTF vif;                                            //creating a handle to a virtual interface for later use

    xor_seq_item    I;                                                //creating a handle to a sequence item and calling it as 'I'

    function new(string name = "xor_driver" , uvm_component parent);    //constructor
        super.new(name , parent);                                        //calling the base class constructor
        `uvm_info("Driver Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);                            //build phase function
        super.build_phase(phase);                                            //calling the base class constructor
        `uvm_info("Driver Class" , "Build Phase" , UVM_LOW)

        uvm_config_db #(virtual XOR_INTF)::get(this , "" , "vif" , vif);        //fetching the virtual interface which will be set from the top module and assigning it to the local virtual interface handle
    endfunction : build_phase


    task run_phase(uvm_phase phase);                                        //run phase function
        forever
        begin
            @(posedge vif.clk);
            `uvm_info("Driver Class" , "Run Phase" , UVM_LOW)
            I = xor_seq_item::type_id::create("I");                            //creating a new object but using the same handle 'I' 
            seq_item_port.get_next_item(I);                                    //getting the next sequence item from the sequencer class 
            vif.A <= I.A;
            vif.B <= I.B;
            seq_item_port.item_done();
        end
    endtask : run_phase


endclass : xor_driver










