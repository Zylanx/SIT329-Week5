module led2 (
	input i_clk,
	input i_button,
	
	output wire o_sensor_led = 0,
	output wire [7:0] o_board_leds = 0
);
	
	// Button stabiliser
	// Stops metastability by passing the button through 2 clock driven flipflops.
	// That way by the time the button makes it through the flipflops it will have a given state
	reg r_button_synchroniser = 0;
	reg r_synced_button = 0;
	
	wire r_debounced;
	
	// Button stabiliser block
	// Design from https://zipcpu.com/blog/2017/08/04/debouncing.html
	always @(posedge i_clk) begin
		{r_synced_button, r_button_synchroniser} = {r_button_synchroniser, i_button};
	end
	
	wire w_press_detected;

	debouncer debouncer(
		.i_clk(i_clk),
		.i_button(r_synced_button),
		.o_debounced(r_debounced)
	);
	
	button_controller button_controller(
		.i_clk(i_clk),
		.i_button(r_debounced),
		.o_count(o_board_leds),
		.o_press(w_press_detected)
	);
	
	led_controller led_controller(
		.i_clk(i_clk),
		.i_press(w_press_detected),
		.o_led(o_sensor_led)
	);

endmodule