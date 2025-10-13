class sample;
  rand bit [7:0] sarr[5];//Static Array
  rand bit [7:0] darr[];//Dynamic Array
  constraint c1 {unique {sarr};}
  constraint c2 {unique {darr};
                 darr.size ==6;
                }
endclass

module tb;
  sample s=new();
  int i;
  initial begin
    assert (s.randomize());
    foreach (s.sarr[i])
      $display(" sarr[%0d]:%0d",i,s.sarr[i]);
    foreach (s.darr[i])
      $display(" darr[%0d]:%0d",i,s.darr[i]);
  end
endmodule
