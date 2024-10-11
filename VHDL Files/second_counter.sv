// second_counter.sv - Contador de segundos
module second_counter (
    input logic clk,
    input logic reset,
    output logic [5:0] sec,
	 output logic sec_carry
);

    always_ff @(posedge clk or negedge reset) begin //-> Adicionado a leitura para a borda de descida do reset
        
		  //O reset nao esta muito responsivo
		  if (!reset) begin //O reset so pode ser ativo quando estiver ativo dentro da borda positiva do clock de 1Hz que foi reduzido
            sec <= 6'd0;
				sec_carry <=1'b1; //Gambiarra para o funcionar no minuto
        end else begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
					 sec_carry <= 1'b1; //-> carry out para o segundo
            end else begin
                sec <= sec + 1;
					 sec_carry <= 1'b0; //-> carry out para o segundo zero
            end
        end
    end
	 	 
endmodule
