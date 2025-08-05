module tb;
  task one();
    $display("task1 is started at :%0t",$time);
    #30;
    $display("task1 is completed at :%0t",$time);
  endtask
  task two();
    $display("task2 is started at :%0t",$time);
    #50;
    $display("task2 is completed at :%0t",$time);
  endtask
  task three();
    $display("task3 is started at :%0t",$time);
  endtask
  initial 
    begin
      fork
        one();
        two();
        three();
      join;
    end
endmodule
    
