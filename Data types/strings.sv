module top;
  string s1;
  string s2;
  string s3;
  integer num;
  initial 
    begin
      s1="technical";
      s2="hub";
      num=s1.len();
      $display("length=%0d",s1.len());
      num=s2.len();
      $display("length=%0d",num);
      s3={s1,"\n",s2};
      $display("s3=%0s",s3);
    end 
endmodule
