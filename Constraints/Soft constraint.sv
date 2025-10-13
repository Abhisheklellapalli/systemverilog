class sample;
  rand int t;
  constraint cd{soft {t==9};}
endclass
module tb;
  sample s=new();
  initial begin
    assert(s.randomize());
    $display("t=%0d",s.t);
    assert(s.randomize() with {t==10;});
    $display("t=%0d",s.t);
  end
endmodule

