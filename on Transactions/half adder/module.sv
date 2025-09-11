module top;
  generator gen;
  driver dri;
  fa inf();
  mailbox mbx;

  half_adder dut(.a(inf.a),
                 .b(inf.b),
                 .sum(inf.sum),
                 .cout(inf.cout)
                );
  initial begin
    gen=new();
    dri=new();
    mbx=new();
    gen.mbx=mbx;
    dri.mbx=mbx;
    dri.intrf=inf;
    fork
      repeat(4) begin
        gen.go();
        dri.go();
      end
    join
  end
endmodule
