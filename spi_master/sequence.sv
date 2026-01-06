class spi_m_sequence extends uvm_sequence #(spi_m_seq_item);

    `uvm_object_utils(spi_m_sequence);

    spi_m_seq_item  I;

    function new(string name = "spi_m_sequence");
        super.new(name);
    endfunction: new


    task body();
        repeat(20)
        begin
            I = spi_m_seq_item::type_id::create("I");
            `uvm_do(I)
        end
    endtask : body
    
endclass: spi_m_sequence
