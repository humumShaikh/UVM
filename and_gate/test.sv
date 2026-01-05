class ag_test extends uvm_test;

    `uvm_component_utils(ag_test)

    ag_environment  env;
    ag_sequence     seq;

    function new(string name = "ag_test" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env =   ag_environment::type_id::create("env" , this);
        seq =   ag_sequence::type_id::create("seq" , this);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
            phase.raise_objection(this);
            seq.start(env.agent.seqr);
            phase.drop_objection(this);
    endtask : run_phase

endclass : ag_test