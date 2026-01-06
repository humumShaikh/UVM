class xor_test extends uvm_test;

    `uvm_component_utils(xor_test)

    xor_environment     env;
    xor_sequence        seq;
    
    function new(string name = "xor_test" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Test Class" , "Constructor" , UVM_LOW)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Test Class" , "Build Phase" , UVM_LOW)

        seq = xor_sequence::type_id::create("seq" , this);
        env =   xor_environment::type_id::create("env" , this);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq.start(env.agent.seqr);
        phase.drop_objection(this);
    endtask : run_phase

endclass : xor_test