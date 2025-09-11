// Generator
class generator;
trans tx;
mailbox mbx;
task go;
  repeat(4) begin
  tx=new();
    assert(tx.randomize());
    mbx.put(tx);
    tx.print();
  end
endtask
endclass
