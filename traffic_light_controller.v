module traffic_light_controller(
    input clk,
    input reset,
    output reg red,
    output reg green,
    output reg yellow
);

reg [1:0] state;
reg [4:0] count;

parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

always @(posedge clk)
begin
    if (reset)
    begin
        state <= RED;
        count <= 0;
    end
    else
    begin
        case(state)
            RED:
            begin
                if (count == 14)
                begin
                    state <= GREEN;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            GREEN:
            begin
                if (count == 14)
                begin
                    state <= YELLOW;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            YELLOW:
            begin
                if (count == 9)
                begin
                    state <= RED;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            default:
            begin
                state <= RED;
                count <= 0;
            end
        endcase
    end
end

always @(*)
begin
    red = 0;
    green = 0;
    yellow = 0;

    case(state)
        RED: red = 1;
        GREEN: green = 1;
        YELLOW: yellow = 1;
        default: red = 1;
    endcase
end

endmodule