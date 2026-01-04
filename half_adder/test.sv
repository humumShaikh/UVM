class ha_test extends uvm_test;

    `uvm_component_utils(ha_test)

    ha_environment  env;

    ha_base_seq     seq;

    function new(string name = "ha_test" , uvm_component parent);
        super.new(name , parent);
        `uvm_info("Test Class" , "Constructor" , UVM_MEDIUM)
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Test Class" , "Build Phase" , UVM_MEDIUM)
        
        env = ha_environment::type_id::create("env" , this);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq = ha_base_seq::type_id::create("seq" , this);

        repeat(10)
        begin
            #3; seq.start(env.agent.seqr);
        end

        phase.drop_objection(this);
        `uvm_info("Test Class" , "Run Phase" , UVM_MEDIUM)
    endtask : run_phase

endclass : ha_test