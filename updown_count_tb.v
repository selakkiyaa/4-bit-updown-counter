module updown_count_tb;

    reg clk;               
    reg reset;             
    reg up_down;           
    wire [3:0] count;      
    updown_count uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $monitor("Time=%0t | Reset=%b | Up_Down=%b | Count=%b", $time, reset, up_down, count);

        reset = 1; up_down = 1; #20;
        reset = 0;
        up_down = 1; #50;
        up_down = 0; #50;  
        $stop;
    end
endmodule
