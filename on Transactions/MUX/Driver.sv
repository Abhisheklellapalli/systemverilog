// DRIVER
class driver;
  trans tx;
  mailbox dm;
  virtual muxi intrf;
  task go;
    // tx=new();
    dm.get(tx);
    intrf.a = tx.a;
    intrf.b = tx.b;
    intrf.c = tx.c;
    intrf.d = tx.d;
    intrf.e = tx.e;
    intrf.f = tx.f;
    intrf.g = tx.g;
    intrf.h = tx.h;
    intrf.sel = tx.sel;
    tx.print("driver\n");
    #1;
    $display("sel=%0b, yout =%0b",intrf.sel,intrf.yout);
  endtask
endclass
