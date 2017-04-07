module imem(pc, op);
	input [7:0] pc;
	output reg [15:0] op;

`include "def.h"

	always @(pc) begin
		case(pc)
		// synopsys parallel_case
		// synopsys full_case
// TO_START
		// クリアしているか？
		0 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_BRD;
			op[7:4] = CHK_CLR;
			op[3:0] = 4'b0;
		end

		1 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_END;
		end

		// 最大移動回数か？
		2 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_CNT;
			op[7:4] = CHK_MXCNT;
			op[3:0] = 4'b0;
		end

		3 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV;
		end

		// 現階層は未探索か？
		4 : begin
			op[15:12] = COMP;
			op[11:8] = REG_CNT;
			op[7:4] = REG_MVD;
			op[3:0] = 4'b0;
		end

		5 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_UP;
		end

		// 現在の探索は上か？
		6 : begin
			op[15:12] = GTD;
			op[11:0] = 12'b0;
		end

		7 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_UP;
			op[3:0] = 4'b0;
		end

		8 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_DOWN;
		end

		// 現在の探索は下か？
		9 : begin
			op[15:12] = GTD;
			op[11:0] = 12'b0;
		end

		10 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_DOWN;
			op[3:0] = 4'b0;
		end

		11 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_LEFT;
		end

		// 現在の探索は左か？
		12 : begin
			op[15:12] = GTD;
			op[11:0] = 12'b0;
		end

		13 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_LEFT;
			op[3:0] = 4'b0;
		end

		14 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_RIGHT;
		end

		// 現在の探索は右
		15 : begin
			op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV_;
		end
// end

// TO_UP
		// 現階層の探索を開始
		20 : begin
			op[15:12] = INC;
			op[11:8] = REG_MVD;
			op[7:0] = 8'b0;
		end

		// 上移動を記録
		21 : begin
			op[15:12] = RU;
			op[11:0] = 12'b0;
		end

		// 上に移動できるか？
		22 : begin
			op[15:12] = GSP;
			op[11] = SY;
			op[10:0] = 11'b0;
		end

		23 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_ZERO;
			op[3:0] = 4'b0;
		end

		24 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 前階層の探索は下か？
		25 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		26 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_DOWN;
			op[3:0] = 4'b0;
		end

		27 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 上に移動してカウントを進める
		28 : begin
			op[15:12] = MV;
			op[11:10] = UP;
			op[9:0] = 10'b0;
		end

		29 : begin
			op[15:12] = INC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		30 : begin
			op[15:12] = JMP;
			op[7:0] = TO_START;
		end
// end

// TO_DOWN
		// 下移動を記録
		40 : begin
			op[15:12] = RD;
			op[11:0] = 12'b0;
		end

		// 下に移動できるか？
		41 : begin
			op[15:12] = GSP;
			op[11] = SY;
			op[10:0] = 11'b0;
		end

		42 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_TWO;
			op[3:0] = 4'b0;
		end

		43 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 前階層の探索は上か？
		44 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		45 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_UP;
			op[3:0] = 4'b0;
		end

		46 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 下に移動してカウントを進める
		47 : begin
			op[15:12] = MV;
			op[11:10] = DOWN;
			op[9:0] = 10'b0;
		end

		48 : begin
			op[15:12] = INC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		49 : begin
			op[15:12] = JMP;
			op[7:0] = TO_START;
		end
// end

// TO_LEFT
		// 左移動を記録
		60 : begin
			op[15:12] = RL;
			op[11:0] = 12'b0;
		end

		// 左に移動できるか？
		61 : begin
			op[15:12] = GSP;
			op[11] = SX;
			op[10:0] = 11'b0;
		end

		62 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_ZERO;
			op[3:0] = 4'b0;
		end

		63 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 前階層の探索は右か？
		64 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		65 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_RIGHT;
			op[3:0] = 4'b0;
		end

		66 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 左に移動してカウントを進める
		67 : begin
			op[15:12] = MV;
			op[11:10] = LEFT;
			op[9:0] = 10'b0;
		end

		68 : begin
			op[15:12] = INC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		69 : begin
			op[15:12] = JMP;
			op[7:0] = TO_START;
		end
// end

// TO_RIGHT
		// 右移動を記録
		80 : begin
			op[15:12] = RR;
			op[11:0] = 12'b0;
		end

		// 右に移動できるか？
		81 : begin
			op[15:12] = GSP;
			op[11] = SX;
			op[10:0] = 11'b0;
		end

		82 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_TWO;
			op[3:0] = 4'b0;
		end

		83 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 前階層の探索は左か？
		84 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		85 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_LEFT;
			op[3:0] = 4'b0;
		end

		86 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end

		// 右に移動してカウントを進める
		87 : begin
			op[15:12] = MV;
			op[11:10] = RIGHT;
			op[9:0] = 10'b0;
		end

		88 : begin
			op[15:12] = INC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		89 : begin
			op[15:12] = JMP;
			op[7:0] = TO_START;
		end
// end

// TO_PREV_
		// 現階層の探索を終了
		99 : begin
			op[15:12] = DEC;
			op[11:8] = REG_MVD;
			op[7:0] = 8'b0;
		end

// TO_PREV
		// 全探索が終了したか？
		100 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_CNT;
			op[7:4] = CHK_ZERO;
			op[3:0] = 4'b0;
		end

		101 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_END;
		end

		// 前階層の探索は上か？
		102 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		103 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_UP;
			op[3:0] = 4'b0;
		end

		104 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV_DOWN;
		end

		// 前階層の探索は下か？
		105 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		106 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_DOWN;
			op[3:0] = 4'b0;
		end

		107 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV_UP;
		end

		// 前階層の探索は左か？
		108 : begin
			op[15:12] = GPD;
			op[11:0] = 12'b0;
		end

		109 : begin
			op[15:12] = CHECK;
			op[11:8] = REG_NULL;
			op[7:4] = CHK_LEFT;
			op[3:0] = 4'b0;
		end

		110 : begin
			op[15:12] = JNZ;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV_RIGHT;
		end

		// 前階層の探索は右
		111 : begin
			op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_PREV_LEFT;
		end
// end

// TO_PREV_UP
		// 上に移動してカウントを戻す
		120 : begin
		 	op[15:12] = MV;
			op[11:10] = UP;
			op[9:0] = 10'b0;
		end

		121 : begin
		 	op[15:12] = DEC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		122 : begin
		 	op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end
// end

// TO_PREV_DOWN
		// 下に移動してカウントを戻す
		130 : begin
		 	op[15:12] = MV;
			op[11:10] = DOWN;
			op[9:0] = 10'b0;
		end

		131 : begin
		 	op[15:12] = DEC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		132 : begin
		 	op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end
// end

// TO_PREV_LEFT
		// 左に移動してカウントを戻す
		140 : begin
		 	op[15:12] = MV;
			op[11:10] = LEFT;
			op[9:0] = 10'b0;
		end

		141 : begin
		 	op[15:12] = DEC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		142 : begin
		 	op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end
// end

// TO_PREV_RIGHT
		// 右に移動してカウントを戻す
		150 : begin
		 	op[15:12] = MV;
			op[11:10] = RIGHT;
			op[9:0] = 10'b0;
		end

		151 : begin
		 	op[15:12] = DEC;
			op[11:8] = REG_CNT;
			op[7:0] = 8'b0;
		end

		152 : begin
		 	op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_START;
		end
// end

// TO_END
		160 : begin
			op[15:12] = STORE;
			op[11:8] = REG_ADDR_ORD;
			op[7:4] = REG_ORD;
			op[3:0] = 4'b0;
		end

		161 : begin
			op[15:12] = STORE;
			op[11:8] = REG_ADDR_CNT;
			op[7:4] = REG_CNT;
			op[3:0] = 4'b0;
		end

		162 : begin
			op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_WAIT;
		end

// TO_WAIT
		170 : begin
			op[15:12] = JMP;
			op[11:8] = 4'b0;
			op[7:0] = TO_WAIT;
		end

//		171 : begin
//			op[15:12] = LOAD;
//			op[11:8] = REG_ORD;
//			op[7:4] = REG_ADDR_ORD;
//			op[3:0] = 4'b0;
//		end

		endcase
	end
endmodule
