// second_counter.sv - Contador de segundos
module second_counter (
    input logic clk,
    input logic reset,
    output logic [5:0] sec,
	 output logic sec_carry,
	 output logic reset_all
);

    always_ff @(posedge clk or negedge reset) begin //-> Adicionado a leitura para a borda de descida do reset
        
		  //O reset nao esta muito responsivo
		  if (!reset) begin //O reset so pode ser ativo quando estiver ativo dentro da borda positiva do clock de 1Hz que foi reduzido
            sec <= 6'd0;
				sec_carry <=1'b1;	
				reset_all <= 1;
        end else begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
					 sec_carry <= 1'b1; //-> carry out para o segundo
					 reset_all <= 0;
            end else begin
                sec <= sec + 1;
					 sec_carry <= 1'b0; //-> carry out para o segundo zero
					 reset_all <= 0;
				end
        end
    end
	 	 
endmodule
