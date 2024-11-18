`timescale 1ns / 1ps

module jk_flip_flop_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Signals
    reg J, K, clk, reset;
    wire Q, notQ;

    // Instantiate the JK flip-flop
    jk_flip_flop jk_ff (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .notQ(notQ)
    );

    // Clock generation
    always begin
        clk = 0;
        # (CLK_PERIOD / 2);
        clk = 1;
        # (CLK_PERIOD / 2);
    end

    // Reset initialization
    initial begin
        reset = 0;
        # (2 * CLK_PERIOD); // Wait for 2 clock cycles
        reset = 1;
    end

    // Stimulus generation
    initial begin
    #25
        // Test 1: No change
        J = 0;
        K = 0;
        # (2 * CLK_PERIOD); // Wait for 2 clock cycles

        // Test 2: Toggle
        J = 1;
        K = 1;
        # (2 * CLK_PERIOD); // Wait for 2 clock cycles

        // Test 3: Set
        J = 1;
        K = 0;
        # (2 * CLK_PERIOD); // Wait for 2 clock cycles

        // Test 4: Reset
        J = 0;
        K = 1;
        # (2 * CLK_PERIOD); // Wait for 2 clock cycles

        $finish; // End simulation
    end

endmodule
