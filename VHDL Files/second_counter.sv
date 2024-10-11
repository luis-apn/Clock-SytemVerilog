// second_counter.sv - Contador de segundos
module second_counter (
    input logic clk,
    input logic reset,
    output logic [5:0] sec
);

    always_ff @(posedge clk ) begin
        
		  //O reset nao esta muito responsivo
		  if (!reset) begin //O reset so pode ser ativo quando estiver ativo dentro da borda positiva do clock de 1Hz que foi reduzido
            sec <= 6'd0;
        end else begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
            end else begin
                sec <= sec + 1;
            end
        end
    end
endmodule
