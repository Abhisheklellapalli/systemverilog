interface fa;
  reg a,b,cin;
  wire sum,cout;
endinterface
module fulladder_tb;
  fa intf();
  fulladder fa2( .a(intf.a), .b(intf.b), .cin(intf.cin), .sum(intf.sum), .cout(intf.cout));
  initial
    begin
      repeat(8) begin
        intf.a = $urandom();
        intf.b = $urandom();
        intf.cin = $urandom();
        #10;
        $display("time = %0t a=%b b=%b c=%b sum=%b cout=%b",$time,intf.a,intf.b,intf.cin,intf.sum,intf.cout);
      end
    end
endmodule
