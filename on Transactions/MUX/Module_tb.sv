module tb;
  trans tx;
  generator gen;
  driver div;
  mailbox mbx;
  muxi inf();
  mux dut(.a(inf.a),
          .b(inf.b),
          .c(inf.c),
          .d(inf.d),
          .e(inf.d),
          .f(inf.f),
          .g(inf.g),
          .h(inf.h),
          .sel(inf.sel),
          .yout(inf.yout));
  initial
    begin
      tx=new();
      gen=new();
      div=new();
      mbx=new();
      gen.gm=mbx;
      div.dm=mbx;
      div.intrf=inf;
      repeat(8)
        begin
          fork
            gen.go();
            div.go();
            #1;
          join
        end

    end
endmodule
