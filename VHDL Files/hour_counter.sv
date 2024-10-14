// hour_counter.sv - Contador de horas
module hour_counter (
    input logic clk,
    input logic reset_all,
    input logic min_carry,
    output logic [4:0] hour
);

    always_ff @(posedge min_carry ) begin
        if (reset_all) begin
            hour <= 5'd0;
        end else if (min_carry) begin
            if (hour == 5'd23) begin
                hour <= 5'd0;
            end else begin
                hour <= hour + 1;
				end
        end
    end
	 


endmodule
