interface fa;
  logic a,b,cin;
  logic sum,cout;
endinterface

class generator;
  mailbox mbx1;
  logic a,b,cin;
  task go();
    repeat(8) begin
      a = $urandom_range(0,1);
      b = $urandom_range(0,1);
      cin = $urandom_range(0,1);
      mbx1.put(a);
      mbx1.put(b);
      mbx1.put(cin);
      $display("generation test a: %0b | b: %0b | cin: %0b",a,b,cin);
      #1;
      #9;
    end
  endtask
endclass
class driver;
   mailbox mbx2;
   virtual fa intrf;
   logic a,b,cin;
   task ok();
     forever begin
     mbx2.get(a);
     mbx2.get(b);
     mbx2.get(cin);
     intrf.a = a;
     intrf.b = b;
     intrf.cin = cin;
       #10;
     $display("received values a: %0b b: %0b cin: %0b sum: %0b cout: %0b",a,b,cin,intrf.sum,intrf.cout);
     end
   endtask
endclass

module tb;
  generator gen;
  driver dri;
  mailbox mbx;
  fa inrf();
  full_adder ha(.a(inrf.a), .b(inrf.b), .cin(inrf.cin), .sum(inrf.sum), .cout(inrf.cout));
  initial begin
    gen = new();
    dri = new();
    mbx = new();
    gen.mbx1 = mbx;
    dri.mbx2 = mbx;
    dri.intrf = inrf;
    fork
      gen.go();
      dri.ok();
    join
    #100;
    $finish;
  end
endmodule
