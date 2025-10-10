class ss;
 rand int x;
constraint cd {
  x dist{[100:700] :=1,[800:1450]:=3,[1500:2000]:=4};
}
endclass
module tb;
  ss c;
  initial begin
    c=new();
    repeat(20) begin
      assert(c.randomize());
      $display(" randomize value = %0d",c.x);
    end
  end
endmodule
