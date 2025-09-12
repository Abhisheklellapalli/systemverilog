module mux(
  input a,b,c,d,e,f,g,h,
  input [2:0]sel,
  output logic yout
);
  always@(*) begin
      case(sel)
        3'b000: yout = a;
        3'b001: yout = b;
        3'b010: yout = c;
        3'b011: yout = d;
        3'b100: yout = e;
        3'b101: yout = f;
        3'b110: yout = g;
        3'b111: yout = h;
        default: yout = 1'b0;
      endcase
  end
endmodule
