# 概要
8パズルを解くCPUをFPGAで実装するために書いたVerilogコード。  
2017年3月に作成。  
開発環境はVivado。  
BASYS3 XILINX Artix-7 に実装。

# 動作
スイッチを入れるとrgister.vのregis[1]に代入された8パズルを解き始める。  
解き終わると手順を表示し、UP(BTNU)のプッシュボタンを押すと次の手順、DOWN(BTND)のプッシュボタンを押すと前の手順に移動する。  
7セグLEDの上2桁に手順番号を、下2桁に動かす方向を表示する。

# モジュール
各モジュールについて説明する。

## alu
演算装置 / ALU (Arithmetic and Logic Unit)

## decoder
デコーダ

## divider
分周器

## imem
インストラクションメモリ

## io
入出力

## memory
データメモリ

## pc
プログラムカウンタ

## register
レジスタ

## sel
セレクタ

## zf
ゼロフラグ

## top
モジュールの配線

## def.h
定数の定義
