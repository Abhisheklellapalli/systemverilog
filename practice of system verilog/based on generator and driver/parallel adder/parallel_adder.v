module parallel_adder( input a,b,cin, output sum,cout);
  assign {sum,cout} = a+b+cin;
endmodule
