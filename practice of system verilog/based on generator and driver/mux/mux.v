module mux(input a,b,sel, output y);
  assign y = sel?a:b;
endmodule
