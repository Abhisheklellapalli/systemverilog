interface subb;
  logic [2:0] a,b;
  logic [2:0] sub;
endinterface

class generator;
  mailbox mbx;
  logic [2:0] a,b;
  task go();
    repeat(8) 
      begin
        a=$urandom_range(0,7);
        b=$urandom_range(0,7);
        mbx.put({a,b});
        #1;
        $display("generated testcases a:%0d | b:%0d",a,b);
      end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual subb intrf;
  logic [2:0] a,b;
  logic [5:0] m;
  task go();
    forever
      begin
        mbx.get(m);
        a=m[5:3];
        b=m[2:0];
        intrf.a=a;
        intrf.b=b;
        #1;
        $display("received values a:%0d | b:%0d | sub:%0d",intrf.a,intrf.b,intrf.sub);
      end
  endtask
endclass

module tb;
  generator gen;
  driver div;
  mailbox mbx;
  subb inrf();
  subtraction link(.a(inrf.a),.b(inrf.b),.sub(inrf.sub));
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
