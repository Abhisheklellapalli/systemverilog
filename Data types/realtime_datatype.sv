`timescale 1ns/1ps
module top;
  bit [3:0]a;
  reg [3:0]b;
  time t;
  realtime rt;
  initial 
    begin
      #05;
      a=4'b1101;
      b=4'b1010;
      t=$time;
      rt=$realtime;
      $display("a=%0b",a);
      $display("b=%0b",b);
      $display("t=%0d",t);
      $display("rt=%0f",rt);
    end 
endmodule
