module jk_flip_flop (
    input wire J, // J input
    input wire K, // K input
    input wire clk, // Clock input
    input wire reset, // Asynchronous reset input
    output reg Q, // Q output
    output reg notQ // notQ output
);

    always @(posedge clk or negedge reset) begin
        if (reset == 0) begin
            Q <= 0;
            notQ <= 1;
        end else begin
            case ({J, K})
                2'b00: begin // No change
                    Q <= Q;
                    notQ <= notQ;
                end
                2'b01: begin // Reset
                    Q <= 0;
                    notQ <= 1;
                end
                2'b10: begin // Set
                    Q <= 1;
                    notQ <= 0;
                end
                2'b11: begin // Toggle
                    Q <= ~Q;
                    notQ <= ~notQ;
                end
            endcase
        end
    end

endmodule