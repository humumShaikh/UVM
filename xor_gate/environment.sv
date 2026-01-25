class xor_environment extends uvm_env;                                        //extending the xor_environment from the uvm parent class i.e. deriving it from the uvm parent class

    `uvm_component_utils(xor_environment);                                    //registering this class in the UVM factory

    xor_agent       agent;                                                      //creating a handle named 'agent' of the xor_agent class
    xor_scoreboard  scb;                                                        //creating a handle named 'scb' of the xor_scoreboard class

    function new(string name = "xor_environment", uvm_component parent);        //constructor
        super.new(name, parent);                                                //calling the base class constructor
        `uvm_info("Environment Class" , "Constructor" , UVM_LOW)
    endfunction: new


    function void build_phase(uvm_phase phase);                                //build_phase function
        super.build_phase(phase);                                                //calling the build phase function of the parent class
        `uvm_info("Environment Class" , "Build Phase" , UVM_LOW)

        agent   =   xor_agent::type_id::create("agent" , this);                    //alloting memory to the handle of the agent class
        scb     =   xor_scoreboard::type_id::create("scb" , this);                    //allotting memory to the handle of the scoreboard class
    endfunction: build_phase


    function void connect_phase(uvm_phase phase);                                    //connect_phase function
        super.connect_phase(phase);
        `uvm_info("Environment Class" , "Connect Phase" , UVM_LOW)
        
        agent.mon.item_collected_port.connect(scb.item_collected_export);
    endfunction: connect_phase
    
    

    
endclass: xor_environment











