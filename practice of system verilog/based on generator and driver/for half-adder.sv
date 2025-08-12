// Code your testbench here
// or browse Examples


class generator;
  mailbox mbx;
  logic a, b;
  task run();
    repeat (4) begin                    
      a = $urandom_range(0,1);           
      b = $urandom_range(0,1);
      mbx.put(a);
      mbx.put(b);
      #10;
      $display("generated values a:%b b:%b", a, b);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual wokey intrf;                   
  logic a, b;
  task go();
    forever begin
      mbx.get(a);
      mbx.get(b);
      intrf.a = a;
      intrf.b = b;
      #10;
      $display("received value a:%b b:%b c:%b s:%b", a, b, intrf.c, intrf.s);
    end
  endtask
endclass

module tb;
  generator gen;
  driver div;
  mailbox mbx;
  wokey infr();                         
  halfadder ok(.a(infr.a), .b(infr.b), .c(infr.c), .s(infr.s));

  initial begin
    gen = new();
    div = new();
    mbx = new();                        
    gen.mbx = mbx;
    div.mbx = mbx;
    div.intrf = infr;
    fork
      gen.run();
      div.go();
    join
    #100 $finish;
  end
endmodule
