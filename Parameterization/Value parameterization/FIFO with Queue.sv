`define fifo 1
`define lifo 0
class fifo_lifo #(bit ds_type);
  int int_q[$];
  function void put(int a);
    int_q.push_back(a);
  endfunction
  function void get(output int a);
    if(ds_type==`fifo) a=int_q.pop_front();
    if(ds_type==`lifo) a=int_q.pop_back();
  endfunction
endclass

module ff;
  fifo_lifo #(.ds_type(`fifo)) fif=new();
  int num;
  initial begin
    repeat(5) begin
      num=$urandom_range(10,50);
      fif.put(num);
      $display("push value =%0d",num);
    end
    repeat(5) begin
      fif.get(num);
      $display("get value=%0d",num);
    end
  end
endmodule
