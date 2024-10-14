// minute_counter.sv - Contador de minutos
module minute_counter (
    input logic clk,
    input logic reset_all,
    input logic sec_carry,
    output logic [5:0] min,
	 output logic carry_min
);

    always_ff @(posedge   sec_carry)begin //-> nesta linha foi adcionado o sec_carry para deixar no mesmo padrao tanto o minuto quanto o segundo
        if (reset_all) begin
				carry_min <= 1;
            min <= 6'd0;
        end else if (sec_carry) begin
            if (min == 6'd59) begin
                min <= 6'd0;
					 carry_min <= 1;
            end else begin
                min <= min + 1;
					 carry_min <=0;
            end
        end
    end
	 


endmodule
