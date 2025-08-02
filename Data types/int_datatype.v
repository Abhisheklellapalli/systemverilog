module top;
  int a;
  integer b;
  initial 
    begin
      a=10'hx8z;
      b=10'hx8z;
      $display("value of a:%0h",a);
      $display("value of b:%0h",b);
    end 
endmodule
