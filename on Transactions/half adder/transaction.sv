// Transaction
class trans;
  randc bit a;
  randc bit b;
  function void print();
    $display("-----------------------");
    $display("Generator values a=%b b =%b",a,b);
  endfunction
endclass
