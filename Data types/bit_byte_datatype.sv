module top;
  bit a;
  byte b;
  initial 
    begin
      a=1'b0;
      b=2'b10;
      $display("value of a:%0b",a);
      $display("value of b:%0b",b);
 end 
endmodule
