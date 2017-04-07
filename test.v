`timescale 1ps/1ps

module test;
	reg clk, rst_n;
	reg [4:0] btn;
	wire [11:0] seg;

	top top0(clk, rst_n, btn, seg);

	always #50 clk = ~clk;

	initial begin
		$dumpfile("top_test.vcd");
		$dumpvars(0, top0);
		$dumplimit(1000000000);
//		$monitor($stime, "clk:%b rst:%b", clk, rst_n);
		rst_n <= 0;
		clk <= 0;
		btn <= 5'b11111;
	#200
		rst_n <= 1;
	#800000000
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b01111;
	#100
		btn <= 5'b11111;
	#100

		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		btn <= 5'b10111;
	#100
		btn <= 5'b11111;
	#100
		$finish;
	end
endmodule
