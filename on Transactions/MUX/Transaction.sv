// Transaction

class trans;
  rand bit a,b,c,d,e,f,g,h;
  rand bit [2:0]sel;
  function void print(string tag);
    $display("----------------------------------------------");
    $display("%0s  a=%b  b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel=%0b",tag,a,b,c,d,e,f,g,h,sel);
  endfunction
endclass
