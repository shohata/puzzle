module io(comp, cnt, ord, btn, seg, clk, rst_n);
	input comp;
	input [63:0] cnt;
	input [63:0] ord;
	input [4:0] btn;
	output reg [11:0] seg;
	input clk, rst_n;

	reg [4:0] num;
	reg [1:0] digit;
	reg [7:0] buff [3:0];
	reg [11:0] count;
	reg [4:0] btn_flag;

`include "def.h"

	parameter
		SEG_U = 8'b1_1000001, //U
		SEG_P = 8'b1_0001100, //P
		SEG_D = 8'b1_0100001, //d
		SEG_O = 8'b1_0100011, //o
		SEG_L = 8'b1_1000111, //L
		SEG_E = 8'b1_0000110, //E
		SEG_R = 8'b1_0001000, //R
		SEG_I = 8'b1_1111001, //I
		SEG_S = 8'b1_0010010, //S
		SEG_0 = 8'b1_1000000,
		SEG_1 = 8'b1_1111001,
		SEG_2 = 8'b1_0100100,
		SEG_3 = 8'b1_0110000,
		SEG_4 = 8'b1_0011001,
		SEG_5 = 8'b1_0010010,
		SEG_6 = 8'b1_0000010,
		SEG_7 = 8'b1_1011000,
		SEG_8 = 8'b1_0000000,
		SEG_9 = 8'b1_0010000;

	always @(posedge clk) begin
		if(!rst_n) begin
			num <= 5'b0;
			digit <= 2'b0;
			seg <= 12'b0000_0_0000000;
			count <= 12'b0;
			btn_flag <= 5'b00000;
		end else begin
			count <= count + 1;
			if(count == 0) begin
				// display 7seg
				seg[11:8] <= ~(4'b1 << digit);
				seg[7:0] <= buff[digit];
				digit <= digit + 1;
				// button up
				if(btn[4] && !btn_flag[4]) begin
					btn_flag[4] <= 1;
					if(num < cnt) num <= num + 1;
				end else if(btn[3] && !btn_flag[3]) begin
					btn_flag[3] <= 1;
					if(num > 0) num <= num - 1;
				end
				// button down
				if(!btn[4]) btn_flag[4] <= 0;
				if(!btn[3]) btn_flag[3] <= 0;
				if(!btn[2]) btn_flag[2] <= 0;
				if(!btn[1]) btn_flag[1] <= 0;
				if(!btn[0]) btn_flag[0] <= 0;
			end
		end
	end

	always @(*) begin
		if(comp) begin
			case ((ord & (64'b11 << {num,1'b0})) >> {num,1'b0})
			// synopsys parallel_case
			// synopsys full_case
			UP : begin
				buff[3] = SEG_U;
				buff[2] = SEG_P;
			end
			DOWN : begin
				buff[3] = SEG_D;
				buff[2] = SEG_O;
			end
			LEFT : begin
				buff[3] = SEG_L;
				buff[2] = SEG_E;
			end
			RIGHT : begin
				buff[3] = SEG_R;
				buff[2] = SEG_I;
			end
			endcase
		end else begin
			buff[3] = SEG_S;
			buff[2] = SEG_O;
		end
	end

	always @(*) begin
		if(comp) begin
			case (num)
			// synopsys parallel_case
			// synopsys full_case
			0 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_0;
			end
			1 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_1;
			end
			2 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_2;
			end
			3 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_3;
			end
			4 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_4;
			end
			5 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_5;
			end
			6 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_6;
			end
			7 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_7;
			end
			8 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_8;
			end
			9 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_9;
			end
			10 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_0;
			end
			11 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_1;
			end
			12 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_2;
			end
			13 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_3;
			end
			14 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_4;
			end
			15 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_5;
			end
			16 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_6;
			end
			17 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_7;
			end
			18 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_8;
			end
			19 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_9;
			end
			20 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_0;
			end
			21 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_1;
			end
			22 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_2;
			end
			23 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_3;
			end
			24 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_4;
			end
			25 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_5;
			end
			26 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_6;
			end
			27 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_7;
			end
			28 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_8;
			end
			29 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_9;
			end
			30 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_0;
			end
			31 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_1;
			end
			endcase
		end else begin
			case (cnt)
			// synopsys parallel_case
			// synopsys full_case
			0 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_0;
			end
			1 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_1;
			end
			2 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_2;
			end
			3 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_3;
			end
			4 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_4;
			end
			5 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_5;
			end
			6 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_6;
			end
			7 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_7;
			end
			8 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_8;
			end
			9 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_9;
			end
			10 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_0;
			end
			11 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_1;
			end
			12 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_2;
			end
			13 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_3;
			end
			14 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_4;
			end
			15 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_5;
			end
			16 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_6;
			end
			17 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_7;
			end
			18 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_8;
			end
			19 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_9;
			end
			20 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_0;
			end
			21 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_1;
			end
			22 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_2;
			end
			23 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_3;
			end
			24 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_4;
			end
			25 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_5;
			end
			26 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_6;
			end
			27 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_7;
			end
			28 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_8;
			end
			29 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_9;
			end
			30 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_0;
			end
			31 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_1;
			end
			endcase
		end
	end
endmodule
