module full_subtractor(
  input a,b,cin,
  output diff,borr
  );
  assign diff = a^b^cin;
  assign borr = ~a&b|b&cin|cin&a;
endmodule
