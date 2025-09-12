//GENERATOR
class generator;
  trans tx;
  mailbox gm;
  task go;
    tx=new();
    assert(tx.randomize());
    gm.put(tx);
    tx.print("generator\n");

  endtask
endclassinterface muxi;
  logic a,b,c,d,e,f,g,h;
  logic [2:0]sel;
  logic yout;
endinterface
