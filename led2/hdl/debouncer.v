module debouncer (
	input i_clk,
	input i_button,
	
	output reg o_debounced
);

	parameter LGWAIT = 17;
	
	// This will use the simple button debouncer from https://zipcpu.com/blog/2017/08/04/debouncing.html
	
	reg [(LGWAIT - 1):0] r_timer;
	
	initial r_timer = {(LGWAIT){1'b1}};
	
	always @(posedge i_clk) begin
		r_timer <= r_timer - 1'b1;
	end
		
		
	always @(posedge i_clk) begin
		if (r_timer == 0) begin
			o_debounced <= i_button;
		end
	end
			
endmodule