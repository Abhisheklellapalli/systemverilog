interface m();
  logic a,b,sel;
  logic y;
endinterface

class generator;
  mailbox mbx;
  logic a,b,sel;
  task go();
    repeat(2) begin
    a=$urandom;
    b=$urandom;
    sel=$urandom_range(0,1);
    mbx.put({a,b,sel});
    #1;
    $display("generated values a:%0b | b:%0b | sel:%0b",a,b,sel);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual m intrf;
  logic [2:0] temp;
  task go();
    forever begin
    mbx.get(temp);
    intrf.a = temp[2];
    intrf.b = temp[1];
    intrf.sel = temp[0];
    #1;
    $display("received values a:%0b | b:%0b | sel:%0b | y:%0b",intrf.a,intrf.b,intrf.sel,intrf.y);
    end
  endtask
endclass

module tb;
  generator gen;
  driver div;
  mailbox mbx;
  m inrf();
  mux link(.a(inrf.a), .b(inrf.b),.sel(inrf.sel),.y(inrf.y));
  initial
    begin
      gen=new();
      div=new();
      mbx=new();
      gen.mbx=mbx;
      div.mbx=mbx;
      div.intrf=inrf;
      fork
        gen.go();
        div.go();
      join_none
      #200;
      $finish;
    end
endmodule
