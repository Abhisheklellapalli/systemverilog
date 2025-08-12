interface fs;
  logic a,b,cin;
  logic diff,borr;
endinterface

class generator;
  mailbox mbx1;
  logic a,b,cin;
  task go();
    repeat(8) begin
      a = $random;
      b = $random;
      cin = $random;
      mbx1.put({a,b,cin});
     #1;
      
      $display("generated testcases a=%0b | b:%0b | cin:%0b",a,b,cin);
    end
  endtask
endclass

class driver;
  mailbox mbx2;
// logic a,b,cin;
  virtual fs intrf;
  task go();
    forever begin
      logic [2:0]t;
      mbx2.get(t);
      intrf.a = t[2];
      intrf.b = t[1];
      intrf.cin = t[0];
    #1;
      $display("received values a = %0b | b = %0b | cin = %0b | diff = %0b | borr = %0b",intrf.a,intrf.b,intrf.cin,intrf.diff,intrf.borr);
    end
  endtask
endclass

module tb;
  mailbox mbx;
  generator gen;
  driver div;
  fs inrf();
  full_subtractor oh(.a(inrf.a), .b(inrf.b), .cin(inrf.cin), .diff(inrf.diff), .borr(inrf.borr));
  initial
    begin
      mbx = new();
      gen = new();
      div = new();
      gen.mbx1 = mbx;
      div.mbx2 = mbx;
      div.intrf = inrf;
      fork
        gen.go();
        div.go();
      join_none
      #100;
      $finish;
    end
endmodule
