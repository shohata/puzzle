module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
	input [15:0] op;
	input zf;
	output reg [7:0] pc_in;
	output reg pc_we;
	output reg [3:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [63:0] data;
	output reg [3:0] alu_op;
	output reg mem_we;

`include "def.h"

	always @(*) begin
		case(op[15:12])
		// synopsys parallel_case
		// synopsys full_case
		MV : begin
			// Move
			// src1:board  data:dir  dst:board
			alu_op = op[15:12];
			dst = REG_BRD;
			src1 = REG_BRD;
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 0;
			sel2 = 0;
			data = {62'h0, op[11:10]};
			mem_we = 0;
		end

		RU : begin
			// Record Up
			// src1:order  src0:count  dst:order
			alu_op = op[15:12];
			dst = REG_ORD;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		RD : begin
			// Record Down
			// src1:order  src0:count  dst:order
			alu_op = op[15:12];
			dst = REG_ORD;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		RL : begin
			// Record Left
			// src1:order  src0:count  dst:order
			alu_op = op[15:12];
			dst = REG_ORD;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		RR : begin
			// Record Right
			// src1:order  src0:count  dst:order
			alu_op = op[15:12];
			dst = REG_ORD;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		GPD : begin
			// Get Previous Direction
			// src1:order  src0:count  dst:null
			alu_op = op[15:12];
			dst = REG_NULL;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		GTD : begin
			// Get This Direction
			// src1:order  src0:count  dst:null
			alu_op = op[15:12];
			dst = REG_NULL;
			src1 = REG_ORD;
			src0 = REG_CNT;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		GSP : begin
			// Get Space Position
			// src1:board  src0:x/y  dst:null
			alu_op = op[15:12];
			dst = REG_NULL;
			src1 = REG_BRD;
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 0;
			sel2 = 0;
			data = {63'h0, op[11]};
			mem_we = 0;
		end

		CHECK : begin
			// Check
			// src1:value  data:define
			alu_op = op[15:12];
			dst = 0;
			src1 = op[11:8];
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 0;
			sel1 = 0;
			sel2 = 0;
			data = {60'h0, op[7:4]};
			mem_we = 0;
		end

		COMP : begin
			// Compare
			// src1:value  data:value
			alu_op = op[15:12];
			dst = 0;
			src1 = op[11:8];
			src0 = op[7:4];
			pc_in = 0;
			pc_we = 0;
			reg_we = 0;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		INC : begin
			// Incriment
			// src1:value  dst:value
			alu_op = op[15:12];
			dst = op[11:8];
			src1 = op[11:8];
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		DEC : begin
			// Decriment
			// src1:value  dst:value
			alu_op = op[15:12];
			dst = op[11:8];
			src1 = op[11:8];
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 1;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		JMP : begin
			alu_op = op[15:12];
			dst = 0;
			src1 = 0;
			src0 = 0;
			pc_in = op[7:0];
			pc_we = 1;
			reg_we = 0;
			sel1 = 0;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		JNZ : begin
			alu_op = op[15:12];
			dst = 0;
			src1 = 0;
			src0 = 0;
			pc_in = op[7:0];
			pc_we = zf;
			reg_we = 0;
			sel1 = 0;
			sel2 = 0;
			data = 0;
			mem_we = 0;
		end

		STORE : begin
			alu_op = op[15:12];
			dst = 0;
			src1 = op[11:8];
			src0 = op[7:4];
			pc_in = 0;
			pc_we = 0;
			reg_we = 0;
			sel1 = 1;
			sel2 = 0;
			data = 0;
			mem_we = 1;
		end

		LOAD : begin
			alu_op = op[15:12];
			dst = op[11:8];
			src1 = op[7:4];
			src0 = 0;
			pc_in = 0;
			pc_we = 0;
			reg_we = 0;
			sel1 = 0;
			sel2 = 1;
			data = 0;
			mem_we = 0;
		end

		endcase
	end
endmodule
