module div_clk(input logic reset, input logic clock, output logic clock_out);

//Variavel temporaria para contagem
logic [25:0]cont;

always_ff @(negedge clock)
begin
        if(cont == 26'd24999999) // a cada 0,5s -> 1 borda positiva
            begin
            cont<=26'd0;
            clock_out <= ~clock_out;
            end
        else
            begin
            cont <= cont + 1'b1;
            end
        end

endmodule
