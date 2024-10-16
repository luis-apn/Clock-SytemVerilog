// top_module.sv - Módulo principal para controlar os contadores e displays de 7 segmentos
module top_module (
    input logic clk,            // Clock input
    input logic reset,          // Reset input
    output logic [6:0] seg_sec_ones,  // Segmentos para unidade dos segundos
    output logic [6:0] seg_sec_tens,  // Segmentos para dezena dos segundos
    output logic [6:0] seg_min_ones,  // Segmentos para unidade dos minutos
    output logic [6:0] seg_min_tens,  // Segmentos para dezena dos minutos
    output logic [6:0] seg_hour_ones, // Segmentos para unidade das horas
    output logic [6:0] seg_hour_tens  // Segmentos para dezena das horas
);

    logic [5:0] sec;
    logic [5:0] min;
    logic [4:0] hour;
	 logic clock;
	 logic carry_min;
	 logic carry_sec;
	 logic reset_all;
	 
    // Instancia o contador de segundos, minutos e horas
	 div_clk base_clk(.reset(reset), .clock(clk), .clock_out(clock));
    second_counter sec_inst (.clk(clock), .reset(reset), .sec(sec), .sec_carry(carry_sec), .reset_all(reset_all));
    minute_counter min_inst (.clk(clock), .reset_all(reset_all), .sec_carry(carry_sec), .min(min), .carry_min(carry_min));
    hour_counter hour_inst (.clk(clock), .reset_all(reset_all), .min_carry(carry_min), .hour(hour));

    // Extrai dígitos de unidade e dezena para cada valor
    logic [3:0] sec_ones, sec_tens;
    logic [3:0] min_ones, min_tens;
    logic [3:0] hour_ones, hour_tens;

    assign sec_ones = sec % 10;
    assign sec_tens = sec / 10;
    assign min_ones = min % 10;
    assign min_tens = min / 10;
    assign hour_ones = hour % 10;
    assign hour_tens = hour / 10;

    // Instancia o decodificador de 7 segmentos para cada dígito
    seven_segment_decoder sec_ones_dec (.digit(sec_ones), .segments(seg_sec_ones));
    seven_segment_decoder sec_tens_dec (.digit(sec_tens), .segments(seg_sec_tens));
    seven_segment_decoder min_ones_dec (.digit(min_ones), .segments(seg_min_ones));
    seven_segment_decoder min_tens_dec (.digit(min_tens), .segments(seg_min_tens));
    seven_segment_decoder hour_ones_dec (.digit(hour_ones), .segments(seg_hour_ones));
    seven_segment_decoder hour_tens_dec (.digit(hour_tens), .segments(seg_hour_tens));

endmodule
