`define starting 50
`define ending 70
class ss;
  parameter starting=50, ending=70;
  rand bit [10:0] a;
  rand bit [10:0] b;
  constraint ca {
    a inside{ 10,20};
  }
  constraint cb {
    b inside { [10:70],[starting:ending]};
  }
endclass
module tb;
  ss s=new();
  initial begin
    repeat (10) begin
      s.randomize();
//       $display("value of a=%0d",s.a);
      $display("value of b=%0d",s.b);
    end
  end
endmodule
