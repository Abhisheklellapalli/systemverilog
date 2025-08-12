interface addi;
  logic [3:0] a,b;
  logic [7:0] add;
endinterface

class generator;
  mailbox mbx1;
  task go();
    integer i;
    logic [3:0] a,b;
    for(i=0;i<4;i++) begin
      a=$urandom();
      b=$urandom();
      mbx1.put({a,b});
      #1;
      
      $display("Generated value a:%0d | b:%0d",a,b);
    end
  endtask
endclass

class driver;
  mailbox mbx2;
  logic [3:0] a,b;
  virtual addi intrf;
  task go();
    forever begin
      logic [7:0]m; //temp
    mbx2.get(m);
      intrf.a = m[7:4];
      intrf.b = m[3:0];
    #1;
    $display(" received values a :%0d | b:%0d | add=%0d",intrf.a,intrf.b,intrf.add);
    end
  endtask
endclass

module tb;
  mailbox mbx;
  addi inrf();
  generator gen;
  driver div;
  addition link(.a(inrf.a), .b(inrf.b), .add(inrf.add));
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
      #100;
      $finish;
    end
endmodule
