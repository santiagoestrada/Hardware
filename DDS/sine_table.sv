///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	Sine wave look up table
//				
//	Description:
//				Input signal will be a clock (2KHz - 800KHz)
//				Output is a byte related to 0-127 to generate a sine wave
//
////////////////////////////////////////////////////////////////////////
module sine_table(
	input logic clk_in,
	(* romstyle = "M9K" *) output logic [7:0] out_sine);

logic [7:0] sin_count = '0;

// 	Counter needs to reach a max target of 127
//	Reset and continue
always_ff@(posedge clk_in)
begin
	if(sin_count == 8'h7F)
	begin
		sin_count <= '0;
	end
	else
	begin
		sin_count <= sin_count + 1'b1;
	end
end

// On the opposite edge of the clock
// Cycle through output values to display the Upper/Lower waveform
always_ff@(negedge clk_in)
begin
 case(sin_count)
	0 : out_sine <=  8'h80; //128 
	1 : out_sine <=  8'h86; //134 
	2 : out_sine <=  8'h8c; //140 
	3 : out_sine <=  8'h92; //146 
	4 : out_sine <=  8'h98; //152 
	5 : out_sine <=  8'h9f; //159 
	6 : out_sine <=  8'ha5; //165 
	7 : out_sine <=  8'hab; //171 
	8 : out_sine <=  8'hb0; //176 
	9 : out_sine <=  8'hb6; //182 
	10 : out_sine <=  8'hbc; //188 
	11 : out_sine <=  8'hc1; //193 
	12 : out_sine <=  8'hc7; //199 
	13 : out_sine <=  8'hcc; //204 
	14 : out_sine <=  8'hd1; //209 
	15 : out_sine <=  8'hd5; //213 
	16 : out_sine <=  8'hda; //218 
	17 : out_sine <=  8'hde; //222 
	18 : out_sine <=  8'he2; //226 
	19 : out_sine <=  8'he6; //230 
	20 : out_sine <=  8'hea; //234 
	21 : out_sine <=  8'hed; //237 
	22 : out_sine <=  8'hf0; //240 
	23 : out_sine <=  8'hf3; //243 
	24 : out_sine <=  8'hf6; //246 
	25 : out_sine <=  8'hf8; //248 
	26 : out_sine <=  8'hfa; //250 
	27 : out_sine <=  8'hfc; //252 
	28 : out_sine <=  8'hfd; //253 
	29 : out_sine <=  8'hfe; //254 
	30 : out_sine <=  8'hff; //255 
	31 : out_sine <=  8'hff; //255 
	32 : out_sine <=  8'hff; //255 
	33 : out_sine <=  8'hff; //255 
	34 : out_sine <=  8'hff; //255 
	35 : out_sine <=  8'hfe; //254 
	36 : out_sine <=  8'hfd; //253 
	37 : out_sine <=  8'hfc; //252 
	38 : out_sine <=  8'hfa; //250 
	39 : out_sine <=  8'hf8; //248 
	40 : out_sine <=  8'hf6; //246 
	41 : out_sine <=  8'hf3; //243 
	42 : out_sine <=  8'hf0; //240 
	43 : out_sine <=  8'hed; //237 
	44 : out_sine <=  8'hea; //234 
	45 : out_sine <=  8'he6; //230 
	46 : out_sine <=  8'he2; //226 
	47 : out_sine <=  8'hde; //222 
	48 : out_sine <=  8'hda; //218 
	49 : out_sine <=  8'hd5; //213 
	50 : out_sine <=  8'hd1; //209 
	51 : out_sine <=  8'hcc; //204 
	52 : out_sine <=  8'hc7; //199 
	53 : out_sine <=  8'hc1; //193 
	54 : out_sine <=  8'hbc; //188 
	55 : out_sine <=  8'hb6; //182 
	56 : out_sine <=  8'hb0; //176 
	57 : out_sine <=  8'hab; //171 
	58 : out_sine <=  8'ha5; //165 
	59 : out_sine <=  8'h9f; //159 
	60 : out_sine <=  8'h98; //152 
	61 : out_sine <=  8'h92; //146 
	62 : out_sine <=  8'h8c; //140 
	63 : out_sine <=  8'h86; //134 
	64 : out_sine <=  8'h80; //128 
	65 : out_sine <=  8'h79; //121 
	66 : out_sine <=  8'h73; //115 
	67 : out_sine <=  8'h6d; //109 
	68 : out_sine <=  8'h67; //103 
	69 : out_sine <=  8'h60; //96 
	70 : out_sine <=  8'h5a; //90 
	71 : out_sine <=  8'h54; //84 
	72 : out_sine <=  8'h4f; //79 
	73 : out_sine <=  8'h49; //73 
	74 : out_sine <=  8'h43; //67 
	75 : out_sine <=  8'h3e; //62 
	76 : out_sine <=  8'h38; //56 
	77 : out_sine <=  8'h33; //51 
	78 : out_sine <=  8'h2e; //46 
	79 : out_sine <=  8'h2a; //42 
	80 : out_sine <=  8'h25; //37 
	81 : out_sine <=  8'h21; //33 
	82 : out_sine <=  8'h1d; //29 
	83 : out_sine <=  8'h19; //25 
	84 : out_sine <=  8'h15; //21 
	85 : out_sine <=  8'h12; //18 
	86 : out_sine <=  8'hf; //15 
	87 : out_sine <=  8'hc; //12 
	88 : out_sine <=  8'h9; //9 
	89 : out_sine <=  8'h7; //7 
	90 : out_sine <=  8'h5; //5 
	91 : out_sine <=  8'h3; //3 
	92 : out_sine <=  8'h2; //2 
	93 : out_sine <=  8'h1; //1 
	94 : out_sine <=  8'h0; //0 
	95 : out_sine <=  8'h0; //0 
	96 : out_sine <=  8'h1; //1 
	97 : out_sine <=  8'h0; //0 
	98 : out_sine <=  8'h0; //0 
	99 : out_sine <=  8'h1; //1 
	100 : out_sine <=  8'h2; //2 
	101 : out_sine <=  8'h3; //3 
	102 : out_sine <=  8'h5; //5 
	103 : out_sine <=  8'h7; //7 
	104 : out_sine <=  8'h9; //9 
	105 : out_sine <=  8'hc; //12 
	106 : out_sine <=  8'hf; //15 
	107 : out_sine <=  8'h12; //18 
	108 : out_sine <=  8'h15; //21 
	109 : out_sine <=  8'h19; //25 
	110 : out_sine <=  8'h1d; //29 
	111 : out_sine <=  8'h21; //33 
	112 : out_sine <=  8'h25; //37 
	113 : out_sine <=  8'h2a; //42 
	114 : out_sine <=  8'h2e; //46 
	115 : out_sine <=  8'h33; //51 
	116 : out_sine <=  8'h38; //56 
	117 : out_sine <=  8'h3e; //62 
	118 : out_sine <=  8'h43; //67 
	119 : out_sine <=  8'h49; //73 
	120 : out_sine <=  8'h4f; //79 
	121 : out_sine <=  8'h54; //84 
	122 : out_sine <=  8'h5a; //90 
	123 : out_sine <=  8'h60; //96 
	124 : out_sine <=  8'h67; //103 
	125 : out_sine <=  8'h6d; //109 
	126 : out_sine <=  8'h73; //115
	127 : out_sine <=  8'h79; //121
	default:
		out_sine <= out_sine;
 endcase
end

endmodule
