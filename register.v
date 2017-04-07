module register(src0, src1, dst, we, data, clk, rst_n, data0, data1, comp, cnt, ord);
	input clk, rst_n;
	input [3:0] src0, src1;
	input [3:0] dst;
	input we;
	input [63:0] data;
	output wire [63:0] data0, data1;
	output wire comp;
	output wire [63:0] cnt, ord;

	reg [63:0] regis [15:0];
	wire [63:0] reg_null, reg_brd, reg_ord, reg_cnt, reg_mvd;

`include "def.h"

	always @(posedge clk) begin
		if(!rst_n) begin
			regis[0] <= 0; // null
//			regis[1] <= 64'h6_0000_687_0_954_0_321;
			regis[1] <= 64'h5_0000_568_0_297_0_314; // board
			regis[2] <= 0; // order
			regis[3] <= 0; // count
			regis[4] <= 0; // moved
			regis[5] <= 0; // memory address
			regis[6] <= 1; // memory address
			regis[7] <= 0;
			regis[8] <= 0;
			regis[9] <= 0;
			regis[10] <= 0;
			regis[12] <= 0;
			regis[13] <= 0;
			regis[14] <= 0;
			regis[15] <= 0;
		end else begin
			if(we) begin
				regis[dst] <= data;
			end else begin
				regis[dst] <= regis[dst];
			end
		end
	end

	assign data0 = regis[src0];
	assign data1 = regis[src1];

	// io
	assign comp = (regis[REG_BRD] == DEF_CLR) ? 1 : 0;
	assign ord = regis[REG_ORD];
	assign cnt = regis[REG_CNT];

	// 監視用
	assign reg_null = regis[REG_NULL];		// 未指定の値、一時的な値
	assign reg_brd  = regis[REG_BRD];		// 盤
	assign reg_ord  = regis[REG_ORD];		// 手順
	assign reg_cnt  = regis[REG_CNT];		// 探索中階層、回数
	assign reg_mvd  = regis[REG_MVD];		// 探査済み階層
endmodule
