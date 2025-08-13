interface pa();
  logic [3:0] a,b;
  logic [3:0] sum;
  logic cin,cout;
endinterface

class generator;
  mailbox mbx1;
  logic [3:0] a,b;
  logic cin;
  integer i;
  task go();
    repeat(16)
      begin
        a = $urandom();
        b = $urandom();
        cin = $urandom();
        mbx1.put({a,b,cin});
        #1;
        $display("generated values a : %0b | b : %0b | cin : %0b",a,b,cin);
      end
  endtask
endclass

class driver;
  mailbox mbx2;
  virtual pa intrf;
  logic [3:0] a,b;
  logic cin;
  task go();
    forever
      begin
        logic [8:0] m;
        mbx2.get(m);
        intrf.a = m[8:5];
        intrf.b = m[4:1];
        intrf.cin = m[0];
        #1;
        $display("received values a : %0b | b : %0b | cin : %0b | sum : %0b | cout = %0b",intrf.a,intrf.b,intrf.cin,intrf.sum,intrf.cout);
      end
  endtask
endclass

module tb;
 generator gen;
  driver div;
  mailbox mbx;
  pa inrf();
  parallel_adder link(.a(inrf.a), .b(inrf.b), .cin(inrf.cin), .sum(inrf.sum), .cout(inrf.cout));
  initial 
    begin
      gen = new();
      div = new();
      mbx = new();
      gen.mbx1 = mbx;
      div.mbx2 = mbx;
      div.intrf = inrf;
      fork
        gen.go();
        div.go();
      join_none
      #200S;
      $finish;
    end
endmodule
