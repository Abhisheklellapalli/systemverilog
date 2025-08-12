module halfadder(a,b,dif,bor);
  input a,b;
  output dif,bor;
  assign dif = a^b;
  assign bor = ~a&b;
endmodule

interface wokey();
  logic a,b;
  logic dif,bor;
endinterface
