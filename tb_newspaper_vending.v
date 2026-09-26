`timescale 1ns / 1ps

module tb_newspaper_vending;

    reg clk;
    reg reset;
    reg N;
    reg D;

    wire vend;

    // Instantiate DUT
    newspaper_vending DUT (
        .clk(clk),
        .reset(reset),
        .N(N),
        .D(D),
        .vend(vend)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial
    begin

        // Initial values
        clk = 0;
        reset = 1;
        N = 0;
        D = 0;

        // Reset
        #10;
        reset = 0;

        // --------------------------------
        // TEST 1: Nickel + Dime
        // --------------------------------

        #10;
        N = 1;
        D = 0;

        #10;
        N = 0;
        D = 1;

        #10;
        N = 0;
        D = 0;

        // --------------------------------
        // TEST 2: Dime + Nickel
        // --------------------------------

        #20;
        D = 1;

        #10;
        D = 0;
        N = 1;

        #10;
        N = 0;

        // --------------------------------
        // TEST 3: Three Nickels
        // --------------------------------

        #20;
        N = 1;

        #10;
        N = 0;
        N = 1;

        #10;
        N = 0;
        N = 1;

        #10;
        N = 0;

        // --------------------------------
        // TEST 4: Two Dimes
        // --------------------------------

        #20;
        D = 1;

        #10;
        D = 0;
        D = 1;

        #10;
        D = 0;

        #20;

        $finish;

    end

endmodule