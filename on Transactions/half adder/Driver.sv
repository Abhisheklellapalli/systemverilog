// Driver
class driver;
  trans tx;
  mailbox mbx;
  virtual fa intrf;
  task go;
    mbx.get(tx);
    intrf.a=tx.a;
    intrf.b=tx.b;
    #1;
    $display(" driver values a=%b b=%b | sum:%b cout:%b ",intrf.a,intrf.b,intrf.sum,intrf.cout);
  endtask
endclass
