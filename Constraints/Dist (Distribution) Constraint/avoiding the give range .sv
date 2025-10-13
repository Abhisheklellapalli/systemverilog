class ss;
  rand bit [4:0]a;
  constraint cd{ !(a inside{ [0:10]}); 
  }
endclass

module tb;
  ss s=new();
  initial begin
  repeat (10) begin
    assert(s.randomize());
    $display( "value is %0d",s.a);
  end
  end
endmodule
