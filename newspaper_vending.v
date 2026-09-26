module newspaper_vending(
    input  wire clk,
    input  wire reset,
    input  wire N,
    input  wire D,
    output reg  vend
);

    // State declaration
    reg [2:0] state, next_state;

    parameter S0  = 3'b000;
    parameter S5  = 3'b001;
    parameter S10 = 3'b010;
    parameter S15 = 3'b011;
    parameter S20 = 3'b100;

    // State register
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*)
    begin
        // Default
        next_state = state;

        case(state)

            S0:
            begin
                if (N)
                    next_state = S5;
                else if (D)
                    next_state = S10;
                else
                    next_state = S0;
            end

            S5:
            begin
                if (N)
                    next_state = S10;
                else if (D)
                    next_state = S15;
                else
                    next_state = S5;
            end

            S10:
            begin
                if (N)
                    next_state = S15;
                else if (D)
                    next_state = S20;
                else
                    next_state = S10;
            end

            S15:
            begin
                next_state = S0;
            end

            S20:
            begin
                next_state = S0;
            end

            default:
            begin
                next_state = S0;
            end

        endcase
    end

    // Vend output
    always @(*)
    begin
        if ((state == S15) || (state == S20))
            vend = 1'b1;
        else
            vend = 1'b0;
    end

endmodule