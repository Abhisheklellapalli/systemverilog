module addition(
  input reg [3:0] a,b,
  output wire [7:0] add
);
  assign add = a+b;
endmodule
