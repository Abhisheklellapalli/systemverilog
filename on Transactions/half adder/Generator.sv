// Generator
class generator;
  trans tx;
  mailbox mbx;
  task go;
    tx=new();
      assert(tx.randomize());
      mbx.put(tx);
      tx.print();
  endtask
endclass
