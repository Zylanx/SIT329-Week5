module led_controller (
	input i_clk,
	input i_press,
	
	output reg o_led
);
	
	// Counter
	reg [24:0] r_on_counter = 24'd0;
	
	// Counter block
	always @(posedge i_clk) begin
		if (i_press == 1) begin
			r_on_counter <= 26'd25_000_000;
			o_led <= 1;
		end
		else if (r_on_counter == 0) begin
			r_on_counter <= 0;
			o_led <= 0;
		end
		else if (r_on_counter > 0) begin
			r_on_counter <= r_on_counter - 26'd1;
			o_led <= 1;
		end
	end
	
endmodule