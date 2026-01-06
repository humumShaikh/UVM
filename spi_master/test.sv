class spi_m_test extends uvm_test;

    `uvm_component_utils(spi_m_test)

    spi_m_environment   env;
    spi_m_sequence      seq;

    function new(string name = "spi_m_test" , uvm_component parent);
        super.new(name , parent);
    endfunction : new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        seq = spi_m_sequence::type_id::create("seq" , this);
        env = spi_m_environment::type_id::create("env" , this);
    endfunction : build_phase


    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq.start(env.agent.seqr);
        phase.drop_objection(this);
    endtask : run_phase

endclass : spi_m_test