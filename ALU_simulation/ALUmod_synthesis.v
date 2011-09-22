////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.53d
//  \   \         Application: netgen
//  /   /         Filename: ALUmod_synthesis.v
// /___/   /\     Timestamp: Thu Sep 22 15:55:03 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ALUmod.ngc ALUmod_synthesis.v 
// Device	: xc3s500e-5-vq100
// Input file	: ALUmod.ngc
// Output file	: C:\Users\robertc\Documents\school\CS3710\ALU\netgen\synthesis\ALUmod_synthesis.v
// # of Modules	: 1
// Design Name	: ALUmod
// Xilinx        : C:\Xilinx\12.1\ISE_DS\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ALUmodSynth (
  carry, S, CLFZN, opext, A, B, opcode
);
  input carry;
  output [15 : 0] S;
  output [4 : 0] CLFZN;
  input [3 : 0] opext;
  input [15 : 0] A;
  input [15 : 0] B;
  input [3 : 0] opcode;
  wire A_0_IBUF_32;
  wire A_10_IBUF_33;
  wire A_11_IBUF_34;
  wire A_12_IBUF_35;
  wire A_13_IBUF_36;
  wire A_14_IBUF_37;
  wire A_15_IBUF_38;
  wire A_1_IBUF_39;
  wire A_2_IBUF_40;
  wire A_3_IBUF_41;
  wire A_4_IBUF_42;
  wire A_5_IBUF_43;
  wire A_6_IBUF_44;
  wire A_7_IBUF_45;
  wire A_8_IBUF_46;
  wire A_9_IBUF_47;
  wire B_0_IBUF_64;
  wire B_10_IBUF_65;
  wire B_11_IBUF_66;
  wire B_12_IBUF_67;
  wire B_13_IBUF_68;
  wire B_14_IBUF_69;
  wire B_15_IBUF_70;
  wire B_1_IBUF_71;
  wire B_2_IBUF_72;
  wire B_3_IBUF_73;
  wire B_4_IBUF_74;
  wire B_5_IBUF_75;
  wire B_6_IBUF_76;
  wire B_7_IBUF_77;
  wire B_8_IBUF_78;
  wire B_9_IBUF_79;
  wire CLFZN_0_OBUF_85;
  wire CLFZN_0_mux000018_86;
  wire CLFZN_1_OBUF_87;
  wire CLFZN_2_OBUF_88;
  wire CLFZN_2_mux000112_89;
  wire CLFZN_2_mux0001124_90;
  wire CLFZN_2_mux0001153_91;
  wire CLFZN_2_mux0001172_92;
  wire CLFZN_2_mux000121_93;
  wire CLFZN_2_mux00015_94;
  wire CLFZN_2_mux000155_95;
  wire CLFZN_2_mux000170_96;
  wire CLFZN_3_OBUF_97;
  wire CLFZN_4_OBUF_98;
  wire CLFZN_4_cmp_eq0001;
  wire CLFZN_4_cmp_eq0002;
  wire CLFZN_4_cmp_eq00031;
  wire CLFZN_4_cmp_eq0004;
  wire CLFZN_4_cmp_eq0005;
  wire CLFZN_4_cmp_eq0008;
  wire CLFZN_4_cmp_eq0009;
  wire CLFZN_4_cmp_eq0010;
  wire CLFZN_4_cmp_eq0013;
  wire CLFZN_4_cmp_eq00131_108;
  wire CLFZN_4_cmp_eq0016;
  wire Madd_AUX_5_index0000;
  wire \Madd__AUX_9_cy<10>_rt_144 ;
  wire \Madd__AUX_9_cy<11>_rt_146 ;
  wire \Madd__AUX_9_cy<12>_rt_148 ;
  wire \Madd__AUX_9_cy<13>_rt_150 ;
  wire \Madd__AUX_9_cy<14>_rt_152 ;
  wire \Madd__AUX_9_cy<15>_rt_154 ;
  wire \Madd__AUX_9_cy<1>_rt_156 ;
  wire \Madd__AUX_9_cy<2>_rt_158 ;
  wire \Madd__AUX_9_cy<3>_rt_160 ;
  wire \Madd__AUX_9_cy<4>_rt_162 ;
  wire \Madd__AUX_9_cy<5>_rt_164 ;
  wire \Madd__AUX_9_cy<6>_rt_166 ;
  wire \Madd__AUX_9_cy<7>_rt_168 ;
  wire \Madd__AUX_9_cy<8>_rt_170 ;
  wire \Madd__AUX_9_cy<9>_rt_172 ;
  wire \Madd__AUX_9_xor<16>_rt_174 ;
  wire N0;
  wire N01;
  wire N1;
  wire N10;
  wire N11;
  wire N18;
  wire N2;
  wire N3;
  wire N36;
  wire N38;
  wire N39;
  wire N411;
  wire N42;
  wire N43;
  wire N44;
  wire N47;
  wire N5;
  wire N55;
  wire N57;
  wire N59;
  wire N61;
  wire N63;
  wire N65;
  wire N67;
  wire N69;
  wire N7;
  wire N71;
  wire N73;
  wire N75;
  wire N77;
  wire N8;
  wire N81;
  wire N89;
  wire N9;
  wire N91;
  wire N93;
  wire N94;
  wire \S<0>136_324 ;
  wire \S<0>17_325 ;
  wire \S<0>182_326 ;
  wire \S<0>217_327 ;
  wire \S<0>232_328 ;
  wire \S<0>258_329 ;
  wire \S<0>30_330 ;
  wire \S<0>4_331 ;
  wire \S<0>43_332 ;
  wire \S<0>67_333 ;
  wire \S<0>76_334 ;
  wire \S<0>89_335 ;
  wire \S<10>11 ;
  wire \S<10>1116_338 ;
  wire \S<10>144_339 ;
  wire \S<10>21_340 ;
  wire \S<10>4_341 ;
  wire \S<10>40_342 ;
  wire \S<10>49_343 ;
  wire \S<10>7_344 ;
  wire \S<11>11_346 ;
  wire \S<11>21_347 ;
  wire \S<11>4_348 ;
  wire \S<11>40_349 ;
  wire \S<11>49_350 ;
  wire \S<11>7_351 ;
  wire \S<12>11_353 ;
  wire \S<12>21_354 ;
  wire \S<12>4_355 ;
  wire \S<12>40_356 ;
  wire \S<12>49_357 ;
  wire \S<12>7_358 ;
  wire \S<13>11_360 ;
  wire \S<13>21_361 ;
  wire \S<13>4_362 ;
  wire \S<13>40_363 ;
  wire \S<13>49_364 ;
  wire \S<13>7_365 ;
  wire \S<14>13_367 ;
  wire \S<14>32_368 ;
  wire \S<14>53_369 ;
  wire \S<14>6_370 ;
  wire \S<15>110_372 ;
  wire \S<15>125_373 ;
  wire \S<15>45_374 ;
  wire \S<15>61_375 ;
  wire \S<15>79_376 ;
  wire \S<15>95_377 ;
  wire \S<1>11_379 ;
  wire \S<1>18_380 ;
  wire \S<1>22_381 ;
  wire \S<1>4_382 ;
  wire \S<1>45_383 ;
  wire \S<1>54_384 ;
  wire \S<2>11_386 ;
  wire \S<2>18_387 ;
  wire \S<2>22_388 ;
  wire \S<2>4_389 ;
  wire \S<2>45_390 ;
  wire \S<2>54_391 ;
  wire \S<3>11_393 ;
  wire \S<3>18_394 ;
  wire \S<3>22_395 ;
  wire \S<3>4_396 ;
  wire \S<3>45_397 ;
  wire \S<3>54_398 ;
  wire \S<4>11_400 ;
  wire \S<4>18_401 ;
  wire \S<4>22_402 ;
  wire \S<4>4_403 ;
  wire \S<4>45_404 ;
  wire \S<4>54_405 ;
  wire \S<5>11_407 ;
  wire \S<5>18_408 ;
  wire \S<5>4_409 ;
  wire \S<5>45_410 ;
  wire \S<5>54_411 ;
  wire \S<5>73 ;
  wire \S<6>11_414 ;
  wire \S<6>18_415 ;
  wire \S<6>4_416 ;
  wire \S<6>45_417 ;
  wire \S<6>54_418 ;
  wire \S<6>73 ;
  wire \S<7>11_421 ;
  wire \S<7>21_422 ;
  wire \S<7>40_423 ;
  wire \S<7>49_424 ;
  wire \S<7>61_425 ;
  wire \S<8>11_427 ;
  wire \S<8>21_428 ;
  wire \S<8>4_429 ;
  wire \S<8>40_430 ;
  wire \S<8>49_431 ;
  wire \S<8>7_432 ;
  wire \S<9>11_434 ;
  wire \S<9>21_435 ;
  wire \S<9>4_436 ;
  wire \S<9>40_437 ;
  wire \S<9>49_438 ;
  wire \S<9>7_439 ;
  wire S_0_OBUF_440;
  wire S_10_OBUF_441;
  wire S_11_OBUF_442;
  wire S_12_OBUF_443;
  wire S_13_OBUF_444;
  wire S_14_OBUF_445;
  wire S_15_OBUF_446;
  wire S_1_OBUF_447;
  wire S_2_OBUF_448;
  wire S_3_OBUF_449;
  wire S_4_OBUF_450;
  wire S_5_OBUF_451;
  wire S_6_OBUF_452;
  wire S_7_OBUF_453;
  wire S_8_OBUF_454;
  wire S_9_OBUF_455;
  wire carry_IBUF_490;
  wire opcode_0_IBUF_495;
  wire opcode_1_IBUF_496;
  wire opcode_2_IBUF_497;
  wire opcode_3_IBUF_498;
  wire opext_0_IBUF_503;
  wire opext_1_IBUF_504;
  wire opext_2_IBUF_505;
  wire opext_3_IBUF_506;
  wire [15 : 0] AUX_5_addsub0000;
  wire [14 : 0] Madd_AUX_5_addsub0000_cy;
  wire [15 : 0] Madd_AUX_5_addsub0000_lut;
  wire [15 : 0] Madd__AUX_9_cy;
  wire [0 : 0] Madd__AUX_9_lut;
  wire [7 : 0] Mcompar_CLFZN_cmp_eq0000_cy;
  wire [7 : 0] Mcompar_CLFZN_cmp_eq0000_lut;
  wire [15 : 0] Mcompar_CLFZN_cmp_gt0000_cy;
  wire [15 : 0] Mcompar_CLFZN_cmp_gt0000_lut;
  wire [15 : 0] Mcompar_CLFZN_cmp_gt0001_cy;
  wire [15 : 0] Mcompar_CLFZN_cmp_gt0001_lut;
  wire [14 : 0] Msub__old_S_10_cy;
  wire [15 : 0] Msub__old_S_10_lut;
  wire [16 : 0] _AUX_9;
  wire [15 : 0] _old_S_10;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<0>  (
    .I0(A_0_IBUF_32),
    .I1(B_0_IBUF_64),
    .O(Madd_AUX_5_addsub0000_lut[0])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<0>  (
    .CI(N0),
    .DI(A_0_IBUF_32),
    .S(Madd_AUX_5_addsub0000_lut[0]),
    .O(Madd_AUX_5_addsub0000_cy[0])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_AUX_5_addsub0000_lut[0]),
    .O(AUX_5_addsub0000[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<1>  (
    .I0(A_1_IBUF_39),
    .I1(B_1_IBUF_71),
    .O(Madd_AUX_5_addsub0000_lut[1])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<1>  (
    .CI(Madd_AUX_5_addsub0000_cy[0]),
    .DI(A_1_IBUF_39),
    .S(Madd_AUX_5_addsub0000_lut[1]),
    .O(Madd_AUX_5_addsub0000_cy[1])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<1>  (
    .CI(Madd_AUX_5_addsub0000_cy[0]),
    .LI(Madd_AUX_5_addsub0000_lut[1]),
    .O(AUX_5_addsub0000[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<2>  (
    .I0(A_2_IBUF_40),
    .I1(B_2_IBUF_72),
    .O(Madd_AUX_5_addsub0000_lut[2])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<2>  (
    .CI(Madd_AUX_5_addsub0000_cy[1]),
    .DI(A_2_IBUF_40),
    .S(Madd_AUX_5_addsub0000_lut[2]),
    .O(Madd_AUX_5_addsub0000_cy[2])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<2>  (
    .CI(Madd_AUX_5_addsub0000_cy[1]),
    .LI(Madd_AUX_5_addsub0000_lut[2]),
    .O(AUX_5_addsub0000[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<3>  (
    .I0(A_3_IBUF_41),
    .I1(B_3_IBUF_73),
    .O(Madd_AUX_5_addsub0000_lut[3])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<3>  (
    .CI(Madd_AUX_5_addsub0000_cy[2]),
    .DI(A_3_IBUF_41),
    .S(Madd_AUX_5_addsub0000_lut[3]),
    .O(Madd_AUX_5_addsub0000_cy[3])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<3>  (
    .CI(Madd_AUX_5_addsub0000_cy[2]),
    .LI(Madd_AUX_5_addsub0000_lut[3]),
    .O(AUX_5_addsub0000[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<4>  (
    .I0(A_4_IBUF_42),
    .I1(B_4_IBUF_74),
    .O(Madd_AUX_5_addsub0000_lut[4])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<4>  (
    .CI(Madd_AUX_5_addsub0000_cy[3]),
    .DI(A_4_IBUF_42),
    .S(Madd_AUX_5_addsub0000_lut[4]),
    .O(Madd_AUX_5_addsub0000_cy[4])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<4>  (
    .CI(Madd_AUX_5_addsub0000_cy[3]),
    .LI(Madd_AUX_5_addsub0000_lut[4]),
    .O(AUX_5_addsub0000[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<5>  (
    .I0(A_5_IBUF_43),
    .I1(B_5_IBUF_75),
    .O(Madd_AUX_5_addsub0000_lut[5])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<5>  (
    .CI(Madd_AUX_5_addsub0000_cy[4]),
    .DI(A_5_IBUF_43),
    .S(Madd_AUX_5_addsub0000_lut[5]),
    .O(Madd_AUX_5_addsub0000_cy[5])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<5>  (
    .CI(Madd_AUX_5_addsub0000_cy[4]),
    .LI(Madd_AUX_5_addsub0000_lut[5]),
    .O(AUX_5_addsub0000[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<6>  (
    .I0(A_6_IBUF_44),
    .I1(B_6_IBUF_76),
    .O(Madd_AUX_5_addsub0000_lut[6])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<6>  (
    .CI(Madd_AUX_5_addsub0000_cy[5]),
    .DI(A_6_IBUF_44),
    .S(Madd_AUX_5_addsub0000_lut[6]),
    .O(Madd_AUX_5_addsub0000_cy[6])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<6>  (
    .CI(Madd_AUX_5_addsub0000_cy[5]),
    .LI(Madd_AUX_5_addsub0000_lut[6]),
    .O(AUX_5_addsub0000[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<7>  (
    .I0(A_7_IBUF_45),
    .I1(B_7_IBUF_77),
    .O(Madd_AUX_5_addsub0000_lut[7])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<7>  (
    .CI(Madd_AUX_5_addsub0000_cy[6]),
    .DI(A_7_IBUF_45),
    .S(Madd_AUX_5_addsub0000_lut[7]),
    .O(Madd_AUX_5_addsub0000_cy[7])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<7>  (
    .CI(Madd_AUX_5_addsub0000_cy[6]),
    .LI(Madd_AUX_5_addsub0000_lut[7]),
    .O(AUX_5_addsub0000[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<8>  (
    .I0(A_8_IBUF_46),
    .I1(B_8_IBUF_78),
    .O(Madd_AUX_5_addsub0000_lut[8])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<8>  (
    .CI(Madd_AUX_5_addsub0000_cy[7]),
    .DI(A_8_IBUF_46),
    .S(Madd_AUX_5_addsub0000_lut[8]),
    .O(Madd_AUX_5_addsub0000_cy[8])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<8>  (
    .CI(Madd_AUX_5_addsub0000_cy[7]),
    .LI(Madd_AUX_5_addsub0000_lut[8]),
    .O(AUX_5_addsub0000[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<9>  (
    .I0(A_9_IBUF_47),
    .I1(B_9_IBUF_79),
    .O(Madd_AUX_5_addsub0000_lut[9])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<9>  (
    .CI(Madd_AUX_5_addsub0000_cy[8]),
    .DI(A_9_IBUF_47),
    .S(Madd_AUX_5_addsub0000_lut[9]),
    .O(Madd_AUX_5_addsub0000_cy[9])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<9>  (
    .CI(Madd_AUX_5_addsub0000_cy[8]),
    .LI(Madd_AUX_5_addsub0000_lut[9]),
    .O(AUX_5_addsub0000[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<10>  (
    .I0(A_10_IBUF_33),
    .I1(B_10_IBUF_65),
    .O(Madd_AUX_5_addsub0000_lut[10])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<10>  (
    .CI(Madd_AUX_5_addsub0000_cy[9]),
    .DI(A_10_IBUF_33),
    .S(Madd_AUX_5_addsub0000_lut[10]),
    .O(Madd_AUX_5_addsub0000_cy[10])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<10>  (
    .CI(Madd_AUX_5_addsub0000_cy[9]),
    .LI(Madd_AUX_5_addsub0000_lut[10]),
    .O(AUX_5_addsub0000[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<11>  (
    .I0(A_11_IBUF_34),
    .I1(B_11_IBUF_66),
    .O(Madd_AUX_5_addsub0000_lut[11])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<11>  (
    .CI(Madd_AUX_5_addsub0000_cy[10]),
    .DI(A_11_IBUF_34),
    .S(Madd_AUX_5_addsub0000_lut[11]),
    .O(Madd_AUX_5_addsub0000_cy[11])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<11>  (
    .CI(Madd_AUX_5_addsub0000_cy[10]),
    .LI(Madd_AUX_5_addsub0000_lut[11]),
    .O(AUX_5_addsub0000[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<12>  (
    .I0(A_12_IBUF_35),
    .I1(B_12_IBUF_67),
    .O(Madd_AUX_5_addsub0000_lut[12])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<12>  (
    .CI(Madd_AUX_5_addsub0000_cy[11]),
    .DI(A_12_IBUF_35),
    .S(Madd_AUX_5_addsub0000_lut[12]),
    .O(Madd_AUX_5_addsub0000_cy[12])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<12>  (
    .CI(Madd_AUX_5_addsub0000_cy[11]),
    .LI(Madd_AUX_5_addsub0000_lut[12]),
    .O(AUX_5_addsub0000[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<13>  (
    .I0(A_13_IBUF_36),
    .I1(B_13_IBUF_68),
    .O(Madd_AUX_5_addsub0000_lut[13])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<13>  (
    .CI(Madd_AUX_5_addsub0000_cy[12]),
    .DI(A_13_IBUF_36),
    .S(Madd_AUX_5_addsub0000_lut[13]),
    .O(Madd_AUX_5_addsub0000_cy[13])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<13>  (
    .CI(Madd_AUX_5_addsub0000_cy[12]),
    .LI(Madd_AUX_5_addsub0000_lut[13]),
    .O(AUX_5_addsub0000[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<14>  (
    .I0(A_14_IBUF_37),
    .I1(B_14_IBUF_69),
    .O(Madd_AUX_5_addsub0000_lut[14])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<14>  (
    .CI(Madd_AUX_5_addsub0000_cy[13]),
    .DI(A_14_IBUF_37),
    .S(Madd_AUX_5_addsub0000_lut[14]),
    .O(Madd_AUX_5_addsub0000_cy[14])
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<14>  (
    .CI(Madd_AUX_5_addsub0000_cy[13]),
    .LI(Madd_AUX_5_addsub0000_lut[14]),
    .O(AUX_5_addsub0000[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_AUX_5_addsub0000_lut<15>  (
    .I0(A_15_IBUF_38),
    .I1(B_15_IBUF_70),
    .O(Madd_AUX_5_addsub0000_lut[15])
  );
  MUXCY   \Madd_AUX_5_addsub0000_cy<15>  (
    .CI(Madd_AUX_5_addsub0000_cy[14]),
    .DI(A_15_IBUF_38),
    .S(Madd_AUX_5_addsub0000_lut[15]),
    .O(Madd_AUX_5_index0000)
  );
  XORCY   \Madd_AUX_5_addsub0000_xor<15>  (
    .CI(Madd_AUX_5_addsub0000_cy[14]),
    .LI(Madd_AUX_5_addsub0000_lut[15]),
    .O(AUX_5_addsub0000[15])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<0>  (
    .I0(A_0_IBUF_32),
    .I1(B_0_IBUF_64),
    .O(Msub__old_S_10_lut[0])
  );
  MUXCY   \Msub__old_S_10_cy<0>  (
    .CI(N1),
    .DI(A_0_IBUF_32),
    .S(Msub__old_S_10_lut[0]),
    .O(Msub__old_S_10_cy[0])
  );
  XORCY   \Msub__old_S_10_xor<0>  (
    .CI(N1),
    .LI(Msub__old_S_10_lut[0]),
    .O(_old_S_10[0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<1>  (
    .I0(A_1_IBUF_39),
    .I1(B_1_IBUF_71),
    .O(Msub__old_S_10_lut[1])
  );
  MUXCY   \Msub__old_S_10_cy<1>  (
    .CI(Msub__old_S_10_cy[0]),
    .DI(A_1_IBUF_39),
    .S(Msub__old_S_10_lut[1]),
    .O(Msub__old_S_10_cy[1])
  );
  XORCY   \Msub__old_S_10_xor<1>  (
    .CI(Msub__old_S_10_cy[0]),
    .LI(Msub__old_S_10_lut[1]),
    .O(_old_S_10[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<2>  (
    .I0(A_2_IBUF_40),
    .I1(B_2_IBUF_72),
    .O(Msub__old_S_10_lut[2])
  );
  MUXCY   \Msub__old_S_10_cy<2>  (
    .CI(Msub__old_S_10_cy[1]),
    .DI(A_2_IBUF_40),
    .S(Msub__old_S_10_lut[2]),
    .O(Msub__old_S_10_cy[2])
  );
  XORCY   \Msub__old_S_10_xor<2>  (
    .CI(Msub__old_S_10_cy[1]),
    .LI(Msub__old_S_10_lut[2]),
    .O(_old_S_10[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<3>  (
    .I0(A_3_IBUF_41),
    .I1(B_3_IBUF_73),
    .O(Msub__old_S_10_lut[3])
  );
  MUXCY   \Msub__old_S_10_cy<3>  (
    .CI(Msub__old_S_10_cy[2]),
    .DI(A_3_IBUF_41),
    .S(Msub__old_S_10_lut[3]),
    .O(Msub__old_S_10_cy[3])
  );
  XORCY   \Msub__old_S_10_xor<3>  (
    .CI(Msub__old_S_10_cy[2]),
    .LI(Msub__old_S_10_lut[3]),
    .O(_old_S_10[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<4>  (
    .I0(A_4_IBUF_42),
    .I1(B_4_IBUF_74),
    .O(Msub__old_S_10_lut[4])
  );
  MUXCY   \Msub__old_S_10_cy<4>  (
    .CI(Msub__old_S_10_cy[3]),
    .DI(A_4_IBUF_42),
    .S(Msub__old_S_10_lut[4]),
    .O(Msub__old_S_10_cy[4])
  );
  XORCY   \Msub__old_S_10_xor<4>  (
    .CI(Msub__old_S_10_cy[3]),
    .LI(Msub__old_S_10_lut[4]),
    .O(_old_S_10[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<5>  (
    .I0(A_5_IBUF_43),
    .I1(B_5_IBUF_75),
    .O(Msub__old_S_10_lut[5])
  );
  MUXCY   \Msub__old_S_10_cy<5>  (
    .CI(Msub__old_S_10_cy[4]),
    .DI(A_5_IBUF_43),
    .S(Msub__old_S_10_lut[5]),
    .O(Msub__old_S_10_cy[5])
  );
  XORCY   \Msub__old_S_10_xor<5>  (
    .CI(Msub__old_S_10_cy[4]),
    .LI(Msub__old_S_10_lut[5]),
    .O(_old_S_10[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<6>  (
    .I0(A_6_IBUF_44),
    .I1(B_6_IBUF_76),
    .O(Msub__old_S_10_lut[6])
  );
  MUXCY   \Msub__old_S_10_cy<6>  (
    .CI(Msub__old_S_10_cy[5]),
    .DI(A_6_IBUF_44),
    .S(Msub__old_S_10_lut[6]),
    .O(Msub__old_S_10_cy[6])
  );
  XORCY   \Msub__old_S_10_xor<6>  (
    .CI(Msub__old_S_10_cy[5]),
    .LI(Msub__old_S_10_lut[6]),
    .O(_old_S_10[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<7>  (
    .I0(A_7_IBUF_45),
    .I1(B_7_IBUF_77),
    .O(Msub__old_S_10_lut[7])
  );
  MUXCY   \Msub__old_S_10_cy<7>  (
    .CI(Msub__old_S_10_cy[6]),
    .DI(A_7_IBUF_45),
    .S(Msub__old_S_10_lut[7]),
    .O(Msub__old_S_10_cy[7])
  );
  XORCY   \Msub__old_S_10_xor<7>  (
    .CI(Msub__old_S_10_cy[6]),
    .LI(Msub__old_S_10_lut[7]),
    .O(_old_S_10[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<8>  (
    .I0(A_8_IBUF_46),
    .I1(B_8_IBUF_78),
    .O(Msub__old_S_10_lut[8])
  );
  MUXCY   \Msub__old_S_10_cy<8>  (
    .CI(Msub__old_S_10_cy[7]),
    .DI(A_8_IBUF_46),
    .S(Msub__old_S_10_lut[8]),
    .O(Msub__old_S_10_cy[8])
  );
  XORCY   \Msub__old_S_10_xor<8>  (
    .CI(Msub__old_S_10_cy[7]),
    .LI(Msub__old_S_10_lut[8]),
    .O(_old_S_10[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<9>  (
    .I0(A_9_IBUF_47),
    .I1(B_9_IBUF_79),
    .O(Msub__old_S_10_lut[9])
  );
  MUXCY   \Msub__old_S_10_cy<9>  (
    .CI(Msub__old_S_10_cy[8]),
    .DI(A_9_IBUF_47),
    .S(Msub__old_S_10_lut[9]),
    .O(Msub__old_S_10_cy[9])
  );
  XORCY   \Msub__old_S_10_xor<9>  (
    .CI(Msub__old_S_10_cy[8]),
    .LI(Msub__old_S_10_lut[9]),
    .O(_old_S_10[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<10>  (
    .I0(A_10_IBUF_33),
    .I1(B_10_IBUF_65),
    .O(Msub__old_S_10_lut[10])
  );
  MUXCY   \Msub__old_S_10_cy<10>  (
    .CI(Msub__old_S_10_cy[9]),
    .DI(A_10_IBUF_33),
    .S(Msub__old_S_10_lut[10]),
    .O(Msub__old_S_10_cy[10])
  );
  XORCY   \Msub__old_S_10_xor<10>  (
    .CI(Msub__old_S_10_cy[9]),
    .LI(Msub__old_S_10_lut[10]),
    .O(_old_S_10[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<11>  (
    .I0(A_11_IBUF_34),
    .I1(B_11_IBUF_66),
    .O(Msub__old_S_10_lut[11])
  );
  MUXCY   \Msub__old_S_10_cy<11>  (
    .CI(Msub__old_S_10_cy[10]),
    .DI(A_11_IBUF_34),
    .S(Msub__old_S_10_lut[11]),
    .O(Msub__old_S_10_cy[11])
  );
  XORCY   \Msub__old_S_10_xor<11>  (
    .CI(Msub__old_S_10_cy[10]),
    .LI(Msub__old_S_10_lut[11]),
    .O(_old_S_10[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<12>  (
    .I0(A_12_IBUF_35),
    .I1(B_12_IBUF_67),
    .O(Msub__old_S_10_lut[12])
  );
  MUXCY   \Msub__old_S_10_cy<12>  (
    .CI(Msub__old_S_10_cy[11]),
    .DI(A_12_IBUF_35),
    .S(Msub__old_S_10_lut[12]),
    .O(Msub__old_S_10_cy[12])
  );
  XORCY   \Msub__old_S_10_xor<12>  (
    .CI(Msub__old_S_10_cy[11]),
    .LI(Msub__old_S_10_lut[12]),
    .O(_old_S_10[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<13>  (
    .I0(A_13_IBUF_36),
    .I1(B_13_IBUF_68),
    .O(Msub__old_S_10_lut[13])
  );
  MUXCY   \Msub__old_S_10_cy<13>  (
    .CI(Msub__old_S_10_cy[12]),
    .DI(A_13_IBUF_36),
    .S(Msub__old_S_10_lut[13]),
    .O(Msub__old_S_10_cy[13])
  );
  XORCY   \Msub__old_S_10_xor<13>  (
    .CI(Msub__old_S_10_cy[12]),
    .LI(Msub__old_S_10_lut[13]),
    .O(_old_S_10[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<14>  (
    .I0(A_14_IBUF_37),
    .I1(B_14_IBUF_69),
    .O(Msub__old_S_10_lut[14])
  );
  MUXCY   \Msub__old_S_10_cy<14>  (
    .CI(Msub__old_S_10_cy[13]),
    .DI(A_14_IBUF_37),
    .S(Msub__old_S_10_lut[14]),
    .O(Msub__old_S_10_cy[14])
  );
  XORCY   \Msub__old_S_10_xor<14>  (
    .CI(Msub__old_S_10_cy[13]),
    .LI(Msub__old_S_10_lut[14]),
    .O(_old_S_10[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__old_S_10_lut<15>  (
    .I0(A_15_IBUF_38),
    .I1(B_15_IBUF_70),
    .O(Msub__old_S_10_lut[15])
  );
  XORCY   \Msub__old_S_10_xor<15>  (
    .CI(Msub__old_S_10_cy[14]),
    .LI(Msub__old_S_10_lut[15]),
    .O(_old_S_10[15])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<0>  (
    .I0(B_0_IBUF_64),
    .I1(A_0_IBUF_32),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[0])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<0>  (
    .CI(N1),
    .DI(B_0_IBUF_64),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[0]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<1>  (
    .I0(B_1_IBUF_71),
    .I1(A_1_IBUF_39),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[1])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<1>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[0]),
    .DI(B_1_IBUF_71),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[1]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<2>  (
    .I0(B_2_IBUF_72),
    .I1(A_2_IBUF_40),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[2])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<2>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[1]),
    .DI(B_2_IBUF_72),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[2]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<3>  (
    .I0(B_3_IBUF_73),
    .I1(A_3_IBUF_41),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[3])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<3>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[2]),
    .DI(B_3_IBUF_73),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[3]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<4>  (
    .I0(B_4_IBUF_74),
    .I1(A_4_IBUF_42),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[4])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<4>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[3]),
    .DI(B_4_IBUF_74),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[4]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<5>  (
    .I0(B_5_IBUF_75),
    .I1(A_5_IBUF_43),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[5])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<5>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[4]),
    .DI(B_5_IBUF_75),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[5]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<6>  (
    .I0(B_6_IBUF_76),
    .I1(A_6_IBUF_44),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[6])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<6>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[5]),
    .DI(B_6_IBUF_76),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[6]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<7>  (
    .I0(B_7_IBUF_77),
    .I1(A_7_IBUF_45),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[7])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<7>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[6]),
    .DI(B_7_IBUF_77),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[7]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<8>  (
    .I0(B_8_IBUF_78),
    .I1(A_8_IBUF_46),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[8])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<8>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[7]),
    .DI(B_8_IBUF_78),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[8]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<9>  (
    .I0(B_9_IBUF_79),
    .I1(A_9_IBUF_47),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[9])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<9>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[8]),
    .DI(B_9_IBUF_79),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[9]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<10>  (
    .I0(B_10_IBUF_65),
    .I1(A_10_IBUF_33),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[10])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<10>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[9]),
    .DI(B_10_IBUF_65),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[10]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<11>  (
    .I0(B_11_IBUF_66),
    .I1(A_11_IBUF_34),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[11])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<11>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[10]),
    .DI(B_11_IBUF_66),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[11]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<12>  (
    .I0(B_12_IBUF_67),
    .I1(A_12_IBUF_35),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[12])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<12>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[11]),
    .DI(B_12_IBUF_67),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[12]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<13>  (
    .I0(B_13_IBUF_68),
    .I1(A_13_IBUF_36),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[13])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<13>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[12]),
    .DI(B_13_IBUF_68),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[13]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<14>  (
    .I0(B_14_IBUF_69),
    .I1(A_14_IBUF_37),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[14])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<14>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[13]),
    .DI(B_14_IBUF_69),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[14]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0001_lut<15>  (
    .I0(A_15_IBUF_38),
    .I1(B_15_IBUF_70),
    .O(Mcompar_CLFZN_cmp_gt0001_lut[15])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0001_cy<15>  (
    .CI(Mcompar_CLFZN_cmp_gt0001_cy[14]),
    .DI(A_15_IBUF_38),
    .S(Mcompar_CLFZN_cmp_gt0001_lut[15]),
    .O(Mcompar_CLFZN_cmp_gt0001_cy[15])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<0>  (
    .I0(B_0_IBUF_64),
    .I1(A_0_IBUF_32),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[0])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<0>  (
    .CI(N1),
    .DI(B_0_IBUF_64),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[0]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<1>  (
    .I0(B_1_IBUF_71),
    .I1(A_1_IBUF_39),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[1])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<1>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[0]),
    .DI(B_1_IBUF_71),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[1]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<2>  (
    .I0(B_2_IBUF_72),
    .I1(A_2_IBUF_40),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[2])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<2>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[1]),
    .DI(B_2_IBUF_72),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[2]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<3>  (
    .I0(B_3_IBUF_73),
    .I1(A_3_IBUF_41),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[3])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<3>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[2]),
    .DI(B_3_IBUF_73),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[3]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<4>  (
    .I0(B_4_IBUF_74),
    .I1(A_4_IBUF_42),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[4])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<4>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[3]),
    .DI(B_4_IBUF_74),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[4]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<5>  (
    .I0(B_5_IBUF_75),
    .I1(A_5_IBUF_43),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[5])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<5>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[4]),
    .DI(B_5_IBUF_75),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[5]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<6>  (
    .I0(B_6_IBUF_76),
    .I1(A_6_IBUF_44),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[6])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<6>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[5]),
    .DI(B_6_IBUF_76),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[6]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<7>  (
    .I0(B_7_IBUF_77),
    .I1(A_7_IBUF_45),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[7])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<7>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[6]),
    .DI(B_7_IBUF_77),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[7]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<8>  (
    .I0(B_8_IBUF_78),
    .I1(A_8_IBUF_46),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[8])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<8>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[7]),
    .DI(B_8_IBUF_78),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[8]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<9>  (
    .I0(B_9_IBUF_79),
    .I1(A_9_IBUF_47),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[9])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<9>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[8]),
    .DI(B_9_IBUF_79),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[9]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<10>  (
    .I0(B_10_IBUF_65),
    .I1(A_10_IBUF_33),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[10])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<10>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[9]),
    .DI(B_10_IBUF_65),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[10]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<11>  (
    .I0(B_11_IBUF_66),
    .I1(A_11_IBUF_34),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[11])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<11>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[10]),
    .DI(B_11_IBUF_66),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[11]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<12>  (
    .I0(B_12_IBUF_67),
    .I1(A_12_IBUF_35),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[12])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<12>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[11]),
    .DI(B_12_IBUF_67),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[12]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<13>  (
    .I0(B_13_IBUF_68),
    .I1(A_13_IBUF_36),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[13])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<13>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[12]),
    .DI(B_13_IBUF_68),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[13]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<14>  (
    .I0(B_14_IBUF_69),
    .I1(A_14_IBUF_37),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[14])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<14>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[13]),
    .DI(B_14_IBUF_69),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[14]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_CLFZN_cmp_gt0000_lut<15>  (
    .I0(B_15_IBUF_70),
    .I1(A_15_IBUF_38),
    .O(Mcompar_CLFZN_cmp_gt0000_lut[15])
  );
  MUXCY   \Mcompar_CLFZN_cmp_gt0000_cy<15>  (
    .CI(Mcompar_CLFZN_cmp_gt0000_cy[14]),
    .DI(B_15_IBUF_70),
    .S(Mcompar_CLFZN_cmp_gt0000_lut[15]),
    .O(Mcompar_CLFZN_cmp_gt0000_cy[15])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<0>  (
    .I0(A_0_IBUF_32),
    .I1(B_0_IBUF_64),
    .I2(A_1_IBUF_39),
    .I3(B_1_IBUF_71),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[0])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[0]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<1>  (
    .I0(A_2_IBUF_40),
    .I1(B_2_IBUF_72),
    .I2(A_3_IBUF_41),
    .I3(B_3_IBUF_73),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[1])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<1>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[0]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[1]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<2>  (
    .I0(A_4_IBUF_42),
    .I1(B_4_IBUF_74),
    .I2(A_5_IBUF_43),
    .I3(B_5_IBUF_75),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[2])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<2>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[1]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[2]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<3>  (
    .I0(A_6_IBUF_44),
    .I1(B_6_IBUF_76),
    .I2(A_7_IBUF_45),
    .I3(B_7_IBUF_77),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[3])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<3>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[2]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[3]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<4>  (
    .I0(A_8_IBUF_46),
    .I1(B_8_IBUF_78),
    .I2(A_9_IBUF_47),
    .I3(B_9_IBUF_79),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[4])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<4>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[3]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[4]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<5>  (
    .I0(A_10_IBUF_33),
    .I1(B_10_IBUF_65),
    .I2(A_11_IBUF_34),
    .I3(B_11_IBUF_66),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[5])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<5>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[4]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[5]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<6>  (
    .I0(A_12_IBUF_35),
    .I1(B_12_IBUF_67),
    .I2(A_13_IBUF_36),
    .I3(B_13_IBUF_68),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[6])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<6>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[5]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[6]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_CLFZN_cmp_eq0000_lut<7>  (
    .I0(A_14_IBUF_37),
    .I1(B_14_IBUF_69),
    .I2(A_15_IBUF_38),
    .I3(B_15_IBUF_70),
    .O(Mcompar_CLFZN_cmp_eq0000_lut[7])
  );
  MUXCY   \Mcompar_CLFZN_cmp_eq0000_cy<7>  (
    .CI(Mcompar_CLFZN_cmp_eq0000_cy[6]),
    .DI(N0),
    .S(Mcompar_CLFZN_cmp_eq0000_lut[7]),
    .O(Mcompar_CLFZN_cmp_eq0000_cy[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd__AUX_9_lut<0>  (
    .I0(AUX_5_addsub0000[0]),
    .I1(carry_IBUF_490),
    .O(Madd__AUX_9_lut[0])
  );
  MUXCY   \Madd__AUX_9_cy<0>  (
    .CI(N0),
    .DI(AUX_5_addsub0000[0]),
    .S(Madd__AUX_9_lut[0]),
    .O(Madd__AUX_9_cy[0])
  );
  XORCY   \Madd__AUX_9_xor<0>  (
    .CI(N0),
    .LI(Madd__AUX_9_lut[0]),
    .O(_AUX_9[0])
  );
  MUXCY   \Madd__AUX_9_cy<1>  (
    .CI(Madd__AUX_9_cy[0]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<1>_rt_156 ),
    .O(Madd__AUX_9_cy[1])
  );
  XORCY   \Madd__AUX_9_xor<1>  (
    .CI(Madd__AUX_9_cy[0]),
    .LI(\Madd__AUX_9_cy<1>_rt_156 ),
    .O(_AUX_9[1])
  );
  MUXCY   \Madd__AUX_9_cy<2>  (
    .CI(Madd__AUX_9_cy[1]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<2>_rt_158 ),
    .O(Madd__AUX_9_cy[2])
  );
  XORCY   \Madd__AUX_9_xor<2>  (
    .CI(Madd__AUX_9_cy[1]),
    .LI(\Madd__AUX_9_cy<2>_rt_158 ),
    .O(_AUX_9[2])
  );
  MUXCY   \Madd__AUX_9_cy<3>  (
    .CI(Madd__AUX_9_cy[2]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<3>_rt_160 ),
    .O(Madd__AUX_9_cy[3])
  );
  XORCY   \Madd__AUX_9_xor<3>  (
    .CI(Madd__AUX_9_cy[2]),
    .LI(\Madd__AUX_9_cy<3>_rt_160 ),
    .O(_AUX_9[3])
  );
  MUXCY   \Madd__AUX_9_cy<4>  (
    .CI(Madd__AUX_9_cy[3]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<4>_rt_162 ),
    .O(Madd__AUX_9_cy[4])
  );
  XORCY   \Madd__AUX_9_xor<4>  (
    .CI(Madd__AUX_9_cy[3]),
    .LI(\Madd__AUX_9_cy<4>_rt_162 ),
    .O(_AUX_9[4])
  );
  MUXCY   \Madd__AUX_9_cy<5>  (
    .CI(Madd__AUX_9_cy[4]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<5>_rt_164 ),
    .O(Madd__AUX_9_cy[5])
  );
  XORCY   \Madd__AUX_9_xor<5>  (
    .CI(Madd__AUX_9_cy[4]),
    .LI(\Madd__AUX_9_cy<5>_rt_164 ),
    .O(_AUX_9[5])
  );
  MUXCY   \Madd__AUX_9_cy<6>  (
    .CI(Madd__AUX_9_cy[5]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<6>_rt_166 ),
    .O(Madd__AUX_9_cy[6])
  );
  XORCY   \Madd__AUX_9_xor<6>  (
    .CI(Madd__AUX_9_cy[5]),
    .LI(\Madd__AUX_9_cy<6>_rt_166 ),
    .O(_AUX_9[6])
  );
  MUXCY   \Madd__AUX_9_cy<7>  (
    .CI(Madd__AUX_9_cy[6]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<7>_rt_168 ),
    .O(Madd__AUX_9_cy[7])
  );
  XORCY   \Madd__AUX_9_xor<7>  (
    .CI(Madd__AUX_9_cy[6]),
    .LI(\Madd__AUX_9_cy<7>_rt_168 ),
    .O(_AUX_9[7])
  );
  MUXCY   \Madd__AUX_9_cy<8>  (
    .CI(Madd__AUX_9_cy[7]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<8>_rt_170 ),
    .O(Madd__AUX_9_cy[8])
  );
  XORCY   \Madd__AUX_9_xor<8>  (
    .CI(Madd__AUX_9_cy[7]),
    .LI(\Madd__AUX_9_cy<8>_rt_170 ),
    .O(_AUX_9[8])
  );
  MUXCY   \Madd__AUX_9_cy<9>  (
    .CI(Madd__AUX_9_cy[8]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<9>_rt_172 ),
    .O(Madd__AUX_9_cy[9])
  );
  XORCY   \Madd__AUX_9_xor<9>  (
    .CI(Madd__AUX_9_cy[8]),
    .LI(\Madd__AUX_9_cy<9>_rt_172 ),
    .O(_AUX_9[9])
  );
  MUXCY   \Madd__AUX_9_cy<10>  (
    .CI(Madd__AUX_9_cy[9]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<10>_rt_144 ),
    .O(Madd__AUX_9_cy[10])
  );
  XORCY   \Madd__AUX_9_xor<10>  (
    .CI(Madd__AUX_9_cy[9]),
    .LI(\Madd__AUX_9_cy<10>_rt_144 ),
    .O(_AUX_9[10])
  );
  MUXCY   \Madd__AUX_9_cy<11>  (
    .CI(Madd__AUX_9_cy[10]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<11>_rt_146 ),
    .O(Madd__AUX_9_cy[11])
  );
  XORCY   \Madd__AUX_9_xor<11>  (
    .CI(Madd__AUX_9_cy[10]),
    .LI(\Madd__AUX_9_cy<11>_rt_146 ),
    .O(_AUX_9[11])
  );
  MUXCY   \Madd__AUX_9_cy<12>  (
    .CI(Madd__AUX_9_cy[11]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<12>_rt_148 ),
    .O(Madd__AUX_9_cy[12])
  );
  XORCY   \Madd__AUX_9_xor<12>  (
    .CI(Madd__AUX_9_cy[11]),
    .LI(\Madd__AUX_9_cy<12>_rt_148 ),
    .O(_AUX_9[12])
  );
  MUXCY   \Madd__AUX_9_cy<13>  (
    .CI(Madd__AUX_9_cy[12]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<13>_rt_150 ),
    .O(Madd__AUX_9_cy[13])
  );
  XORCY   \Madd__AUX_9_xor<13>  (
    .CI(Madd__AUX_9_cy[12]),
    .LI(\Madd__AUX_9_cy<13>_rt_150 ),
    .O(_AUX_9[13])
  );
  MUXCY   \Madd__AUX_9_cy<14>  (
    .CI(Madd__AUX_9_cy[13]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<14>_rt_152 ),
    .O(Madd__AUX_9_cy[14])
  );
  XORCY   \Madd__AUX_9_xor<14>  (
    .CI(Madd__AUX_9_cy[13]),
    .LI(\Madd__AUX_9_cy<14>_rt_152 ),
    .O(_AUX_9[14])
  );
  MUXCY   \Madd__AUX_9_cy<15>  (
    .CI(Madd__AUX_9_cy[14]),
    .DI(N0),
    .S(\Madd__AUX_9_cy<15>_rt_154 ),
    .O(Madd__AUX_9_cy[15])
  );
  XORCY   \Madd__AUX_9_xor<15>  (
    .CI(Madd__AUX_9_cy[14]),
    .LI(\Madd__AUX_9_cy<15>_rt_154 ),
    .O(_AUX_9[15])
  );
  XORCY   \Madd__AUX_9_xor<16>  (
    .CI(Madd__AUX_9_cy[15]),
    .LI(\Madd__AUX_9_xor<16>_rt_174 ),
    .O(_AUX_9[16])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  CLFZN_1_mux00001 (
    .I0(Mcompar_CLFZN_cmp_eq0000_cy[7]),
    .I1(N11),
    .O(CLFZN_1_OBUF_87)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  CLFZN_0_mux000018 (
    .I0(opcode_1_IBUF_496),
    .I1(opcode_0_IBUF_495),
    .I2(opcode_2_IBUF_497),
    .I3(opcode_3_IBUF_498),
    .O(CLFZN_0_mux000018_86)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \S<10>121  (
    .I0(opcode_1_IBUF_496),
    .I1(opcode_2_IBUF_497),
    .I2(opcode_3_IBUF_498),
    .O(N411)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_and000111 (
    .I0(opcode_1_IBUF_496),
    .I1(opcode_2_IBUF_497),
    .I2(opcode_3_IBUF_498),
    .O(N42)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_and000011 (
    .I0(opcode_2_IBUF_497),
    .I1(opcode_0_IBUF_495),
    .I2(opcode_1_IBUF_496),
    .O(N43)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<0>1_SW0  (
    .I0(N9),
    .I1(N36),
    .I2(opcode_0_IBUF_495),
    .I3(N42),
    .O(N47)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \S<0>1  (
    .I0(CLFZN_4_cmp_eq0002),
    .I1(CLFZN_4_cmp_eq0004),
    .I2(N47),
    .O(N01)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<0>41  (
    .I0(B_0_IBUF_64),
    .I1(CLFZN_4_cmp_eq0009),
    .I2(A_1_IBUF_39),
    .I3(N5),
    .O(\S<0>4_331 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \S<0>17  (
    .I0(N10),
    .I1(B_0_IBUF_64),
    .I2(opext_3_IBUF_506),
    .O(\S<0>17_325 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \S<0>30  (
    .I0(A_8_IBUF_46),
    .I1(A_7_IBUF_45),
    .I2(A_6_IBUF_44),
    .I3(A_5_IBUF_43),
    .O(\S<0>30_330 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \S<0>43  (
    .I0(A_4_IBUF_42),
    .I1(A_3_IBUF_41),
    .I2(A_2_IBUF_40),
    .I3(A_1_IBUF_39),
    .O(\S<0>43_332 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \S<0>67  (
    .I0(A_15_IBUF_38),
    .I1(A_14_IBUF_37),
    .I2(A_13_IBUF_36),
    .I3(A_12_IBUF_35),
    .O(\S<0>67_333 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \S<0>76  (
    .I0(A_11_IBUF_34),
    .I1(A_10_IBUF_33),
    .I2(A_9_IBUF_47),
    .O(\S<0>76_334 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \S<0>89  (
    .I0(\S<0>30_330 ),
    .I1(\S<0>43_332 ),
    .I2(\S<0>67_333 ),
    .I3(\S<0>76_334 ),
    .O(\S<0>89_335 )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \S<0>182  (
    .I0(opcode_0_IBUF_495),
    .I1(opcode_2_IBUF_497),
    .I2(opcode_1_IBUF_496),
    .I3(opcode_3_IBUF_498),
    .O(\S<0>182_326 )
  );
  LUT4 #(
    .INIT ( 16'hFFBA ))
  \S<0>232  (
    .I0(CLFZN_4_cmp_eq0009),
    .I1(opext_1_IBUF_504),
    .I2(N39),
    .I3(\S<0>217_327 ),
    .O(\S<0>232_328 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<0>258  (
    .I0(AUX_5_addsub0000[0]),
    .I1(N2),
    .I2(A_0_IBUF_32),
    .I3(\S<0>232_328 ),
    .O(\S<0>258_329 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  CLFZN_4_mux00001 (
    .I0(_AUX_9[16]),
    .I1(N01),
    .I2(Madd_AUX_5_index0000),
    .I3(N2),
    .O(CLFZN_4_OBUF_98)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \S<10>1111  (
    .I0(opext_0_IBUF_503),
    .I1(opext_1_IBUF_504),
    .I2(opext_2_IBUF_505),
    .O(N38)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<0>52  (
    .I0(CLFZN_4_cmp_eq0005),
    .I1(opcode_0_IBUF_495),
    .I2(N411),
    .O(N7)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<10>211  (
    .I0(CLFZN_4_cmp_eq0016),
    .I1(opcode_3_IBUF_498),
    .I2(N43),
    .I3(CLFZN_4_cmp_eq0009),
    .O(N18)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  CLFZN_2_mux00015 (
    .I0(opcode_0_IBUF_495),
    .I1(N42),
    .I2(CLFZN_4_cmp_eq0001),
    .O(CLFZN_2_mux00015_94)
  );
  LUT4 #(
    .INIT ( 16'h88F8 ))
  CLFZN_2_mux000121 (
    .I0(Madd_AUX_5_index0000),
    .I1(CLFZN_2_mux00015_94),
    .I2(CLFZN_2_mux000112_89),
    .I3(AUX_5_addsub0000[15]),
    .O(CLFZN_2_mux000121_93)
  );
  LUT4 #(
    .INIT ( 16'h0082 ))
  CLFZN_2_mux000155 (
    .I0(N43),
    .I1(A_15_IBUF_38),
    .I2(B_15_IBUF_70),
    .I3(opcode_3_IBUF_498),
    .O(CLFZN_2_mux000155_95)
  );
  LUT4 #(
    .INIT ( 16'h2400 ))
  CLFZN_2_mux0001124 (
    .I0(B_15_IBUF_70),
    .I1(A_15_IBUF_38),
    .I2(_old_S_10[15]),
    .I3(N7),
    .O(CLFZN_2_mux0001124_90)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  CLFZN_2_mux0001153 (
    .I0(CLFZN_4_cmp_eq0002),
    .I1(opcode_0_IBUF_495),
    .I2(N42),
    .O(CLFZN_2_mux0001153_91)
  );
  LUT3 #(
    .INIT ( 8'h24 ))
  CLFZN_2_mux0001172 (
    .I0(B_15_IBUF_70),
    .I1(_AUX_9[15]),
    .I2(A_15_IBUF_38),
    .O(CLFZN_2_mux0001172_92)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  CLFZN_4_cmp_eq00161 (
    .I0(N36),
    .I1(opext_3_IBUF_506),
    .I2(N8),
    .O(CLFZN_4_cmp_eq0016)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_cmp_eq00101 (
    .I0(opext_1_IBUF_504),
    .I1(N10),
    .I2(opext_3_IBUF_506),
    .O(CLFZN_4_cmp_eq0010)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  CLFZN_4_cmp_eq00081 (
    .I0(opext_3_IBUF_506),
    .I1(opext_1_IBUF_504),
    .I2(N10),
    .O(CLFZN_4_cmp_eq0008)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_cmp_eq000021 (
    .I0(opext_0_IBUF_503),
    .I1(opext_2_IBUF_505),
    .I2(opext_1_IBUF_504),
    .O(N36)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  CLFZN_4_cmp_eq00041 (
    .I0(opext_1_IBUF_504),
    .I1(N9),
    .I2(opext_0_IBUF_503),
    .I3(opext_2_IBUF_505),
    .O(CLFZN_4_cmp_eq0004)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_cmp_eq00052 (
    .I0(N10),
    .I1(opext_3_IBUF_506),
    .I2(opext_1_IBUF_504),
    .O(CLFZN_4_cmp_eq0005)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  CLFZN_4_cmp_eq00022 (
    .I0(opext_0_IBUF_503),
    .I1(opext_1_IBUF_504),
    .I2(opext_2_IBUF_505),
    .I3(N44),
    .O(CLFZN_4_cmp_eq0002)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  CLFZN_4_cmp_eq00011 (
    .I0(opext_2_IBUF_505),
    .I1(opext_1_IBUF_504),
    .I2(opext_0_IBUF_503),
    .I3(N44),
    .O(CLFZN_4_cmp_eq0001)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  CLFZN_4_cmp_eq000211 (
    .I0(opext_3_IBUF_506),
    .I1(N8),
    .O(N44)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_cmp_eq001111 (
    .I0(N9),
    .I1(opext_0_IBUF_503),
    .I2(opext_2_IBUF_505),
    .O(N39)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  CLFZN_4_cmp_eq000511 (
    .I0(N8),
    .I1(opext_0_IBUF_503),
    .I2(opext_2_IBUF_505),
    .O(N10)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  CLFZN_4_cmp_eq000011 (
    .I0(opcode_3_IBUF_498),
    .I1(opcode_2_IBUF_497),
    .I2(opcode_1_IBUF_496),
    .I3(opcode_0_IBUF_495),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<9>4  (
    .I0(AUX_5_addsub0000[9]),
    .I1(N2),
    .I2(_old_S_10[9]),
    .I3(N7),
    .O(\S<9>4_436 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<9>7  (
    .I0(\S<9>4_436 ),
    .I1(_AUX_9[9]),
    .I2(N01),
    .O(\S<9>7_439 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<9>11  (
    .I0(A_10_IBUF_33),
    .I1(N5),
    .O(\S<9>11_434 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<9>21  (
    .I0(B_9_IBUF_79),
    .I1(A_9_IBUF_47),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<9>21_435 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<9>40  (
    .I0(B_9_IBUF_79),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<9>40_437 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<9>49  (
    .I0(\S<9>11_434 ),
    .I1(A_9_IBUF_47),
    .I2(\S<9>40_437 ),
    .I3(\S<9>21_435 ),
    .O(\S<9>49_438 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<9>74  (
    .I0(\S<9>7_439 ),
    .I1(A_8_IBUF_46),
    .I2(N3),
    .I3(\S<9>49_438 ),
    .O(S_9_OBUF_455)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<8>4  (
    .I0(AUX_5_addsub0000[8]),
    .I1(N2),
    .I2(_old_S_10[8]),
    .I3(N7),
    .O(\S<8>4_429 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<8>7  (
    .I0(\S<8>4_429 ),
    .I1(_AUX_9[8]),
    .I2(N01),
    .O(\S<8>7_432 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<8>11  (
    .I0(A_9_IBUF_47),
    .I1(N5),
    .O(\S<8>11_427 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<8>21  (
    .I0(B_8_IBUF_78),
    .I1(A_8_IBUF_46),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<8>21_428 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<8>40  (
    .I0(B_8_IBUF_78),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<8>40_430 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<8>49  (
    .I0(\S<8>11_427 ),
    .I1(A_8_IBUF_46),
    .I2(\S<8>40_430 ),
    .I3(\S<8>21_428 ),
    .O(\S<8>49_431 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<8>74  (
    .I0(\S<8>7_432 ),
    .I1(A_7_IBUF_45),
    .I2(N3),
    .I3(\S<8>49_431 ),
    .O(S_8_OBUF_454)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<7>11  (
    .I0(A_8_IBUF_46),
    .I1(N5),
    .O(\S<7>11_421 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<7>21  (
    .I0(B_7_IBUF_77),
    .I1(A_7_IBUF_45),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<7>21_422 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<7>40  (
    .I0(B_7_IBUF_77),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<7>40_423 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<7>49  (
    .I0(\S<7>11_421 ),
    .I1(A_7_IBUF_45),
    .I2(\S<7>40_423 ),
    .I3(\S<7>21_422 ),
    .O(\S<7>49_424 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<7>73  (
    .I0(\S<7>61_425 ),
    .I1(A_6_IBUF_44),
    .I2(N3),
    .O(S_7_OBUF_453)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<6>4  (
    .I0(AUX_5_addsub0000[6]),
    .I1(N2),
    .I2(_old_S_10[6]),
    .I3(N7),
    .O(\S<6>4_416 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<6>11  (
    .I0(A_6_IBUF_44),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<6>11_414 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<6>18  (
    .I0(A_7_IBUF_45),
    .I1(N5),
    .I2(B_6_IBUF_76),
    .I3(\S<6>11_414 ),
    .O(\S<6>18_415 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<6>45  (
    .I0(B_6_IBUF_76),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<6>45_417 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<6>54  (
    .I0(_AUX_9[6]),
    .I1(N01),
    .I2(A_6_IBUF_44),
    .I3(\S<6>45_417 ),
    .O(\S<6>54_418 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<5>4  (
    .I0(AUX_5_addsub0000[5]),
    .I1(N2),
    .I2(_old_S_10[5]),
    .I3(N7),
    .O(\S<5>4_409 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<5>11  (
    .I0(A_5_IBUF_43),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<5>11_407 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<5>18  (
    .I0(A_6_IBUF_44),
    .I1(N5),
    .I2(B_5_IBUF_75),
    .I3(\S<5>11_407 ),
    .O(\S<5>18_408 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<5>45  (
    .I0(B_5_IBUF_75),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<5>45_410 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<5>54  (
    .I0(_AUX_9[5]),
    .I1(N01),
    .I2(A_5_IBUF_43),
    .I3(\S<5>45_410 ),
    .O(\S<5>54_411 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<4>4  (
    .I0(AUX_5_addsub0000[4]),
    .I1(N2),
    .I2(_old_S_10[4]),
    .I3(N7),
    .O(\S<4>4_403 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<4>11  (
    .I0(A_4_IBUF_42),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<4>11_400 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<4>18  (
    .I0(A_5_IBUF_43),
    .I1(N5),
    .I2(B_4_IBUF_74),
    .I3(\S<4>11_400 ),
    .O(\S<4>18_401 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \S<4>22  (
    .I0(\S<4>4_403 ),
    .I1(\S<4>18_401 ),
    .O(\S<4>22_402 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<4>45  (
    .I0(B_4_IBUF_74),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<4>45_404 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<4>54  (
    .I0(_AUX_9[4]),
    .I1(N01),
    .I2(A_4_IBUF_42),
    .I3(\S<4>45_404 ),
    .O(\S<4>54_405 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<4>74  (
    .I0(\S<4>22_402 ),
    .I1(A_3_IBUF_41),
    .I2(N3),
    .I3(\S<4>54_405 ),
    .O(S_4_OBUF_450)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<3>4  (
    .I0(AUX_5_addsub0000[3]),
    .I1(N2),
    .I2(_old_S_10[3]),
    .I3(N7),
    .O(\S<3>4_396 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<3>11  (
    .I0(A_3_IBUF_41),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<3>11_393 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<3>18  (
    .I0(A_4_IBUF_42),
    .I1(N5),
    .I2(B_3_IBUF_73),
    .I3(\S<3>11_393 ),
    .O(\S<3>18_394 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \S<3>22  (
    .I0(\S<3>4_396 ),
    .I1(\S<3>18_394 ),
    .O(\S<3>22_395 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<3>45  (
    .I0(B_3_IBUF_73),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<3>45_397 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<3>54  (
    .I0(_AUX_9[3]),
    .I1(N01),
    .I2(A_3_IBUF_41),
    .I3(\S<3>45_397 ),
    .O(\S<3>54_398 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<3>74  (
    .I0(\S<3>22_395 ),
    .I1(A_2_IBUF_40),
    .I2(N3),
    .I3(\S<3>54_398 ),
    .O(S_3_OBUF_449)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<2>4  (
    .I0(AUX_5_addsub0000[2]),
    .I1(N2),
    .I2(_old_S_10[2]),
    .I3(N7),
    .O(\S<2>4_389 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<2>11  (
    .I0(A_2_IBUF_40),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<2>11_386 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<2>18  (
    .I0(A_3_IBUF_41),
    .I1(N5),
    .I2(B_2_IBUF_72),
    .I3(\S<2>11_386 ),
    .O(\S<2>18_387 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \S<2>22  (
    .I0(\S<2>4_389 ),
    .I1(\S<2>18_387 ),
    .O(\S<2>22_388 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<2>45  (
    .I0(B_2_IBUF_72),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<2>45_390 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<2>54  (
    .I0(_AUX_9[2]),
    .I1(N01),
    .I2(A_2_IBUF_40),
    .I3(\S<2>45_390 ),
    .O(\S<2>54_391 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<2>74  (
    .I0(\S<2>22_388 ),
    .I1(A_1_IBUF_39),
    .I2(N3),
    .I3(\S<2>54_391 ),
    .O(S_2_OBUF_448)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<1>4  (
    .I0(AUX_5_addsub0000[1]),
    .I1(N2),
    .I2(_old_S_10[1]),
    .I3(N7),
    .O(\S<1>4_382 )
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<1>11  (
    .I0(A_1_IBUF_39),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<1>11_379 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<1>18  (
    .I0(A_2_IBUF_40),
    .I1(N5),
    .I2(B_1_IBUF_71),
    .I3(\S<1>11_379 ),
    .O(\S<1>18_380 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \S<1>22  (
    .I0(\S<1>4_382 ),
    .I1(\S<1>18_380 ),
    .O(\S<1>22_381 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<1>45  (
    .I0(B_1_IBUF_71),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<1>45_383 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<1>54  (
    .I0(_AUX_9[1]),
    .I1(N01),
    .I2(A_1_IBUF_39),
    .I3(\S<1>45_383 ),
    .O(\S<1>54_384 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<1>74  (
    .I0(\S<1>22_381 ),
    .I1(A_0_IBUF_32),
    .I2(N3),
    .I3(\S<1>54_384 ),
    .O(S_1_OBUF_447)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \S<14>6  (
    .I0(A_14_IBUF_37),
    .I1(CLFZN_4_cmp_eq0010),
    .I2(CLFZN_4_cmp_eq0009),
    .O(\S<14>6_370 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<14>13  (
    .I0(A_15_IBUF_38),
    .I1(N5),
    .I2(B_14_IBUF_69),
    .I3(\S<14>6_370 ),
    .O(\S<14>13_367 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<14>53  (
    .I0(AUX_5_addsub0000[14]),
    .I1(N2),
    .I2(_old_S_10[14]),
    .I3(N7),
    .O(\S<14>53_369 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<13>4  (
    .I0(AUX_5_addsub0000[13]),
    .I1(N2),
    .I2(_old_S_10[13]),
    .I3(N7),
    .O(\S<13>4_362 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<13>7  (
    .I0(\S<13>4_362 ),
    .I1(_AUX_9[13]),
    .I2(N01),
    .O(\S<13>7_365 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<13>11  (
    .I0(A_14_IBUF_37),
    .I1(N5),
    .O(\S<13>11_360 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<13>21  (
    .I0(B_13_IBUF_68),
    .I1(A_13_IBUF_36),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<13>21_361 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<13>40  (
    .I0(B_13_IBUF_68),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<13>40_363 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<13>49  (
    .I0(\S<13>11_360 ),
    .I1(A_13_IBUF_36),
    .I2(\S<13>40_363 ),
    .I3(\S<13>21_361 ),
    .O(\S<13>49_364 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<13>74  (
    .I0(\S<13>7_365 ),
    .I1(A_12_IBUF_35),
    .I2(N3),
    .I3(\S<13>49_364 ),
    .O(S_13_OBUF_444)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<12>4  (
    .I0(AUX_5_addsub0000[12]),
    .I1(N2),
    .I2(_old_S_10[12]),
    .I3(N7),
    .O(\S<12>4_355 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<12>7  (
    .I0(\S<12>4_355 ),
    .I1(_AUX_9[12]),
    .I2(N01),
    .O(\S<12>7_358 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<12>11  (
    .I0(A_13_IBUF_36),
    .I1(N5),
    .O(\S<12>11_353 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<12>21  (
    .I0(B_12_IBUF_67),
    .I1(A_12_IBUF_35),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<12>21_354 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<12>40  (
    .I0(B_12_IBUF_67),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<12>40_356 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<12>49  (
    .I0(\S<12>11_353 ),
    .I1(A_12_IBUF_35),
    .I2(\S<12>40_356 ),
    .I3(\S<12>21_354 ),
    .O(\S<12>49_357 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<12>74  (
    .I0(\S<12>7_358 ),
    .I1(A_11_IBUF_34),
    .I2(N3),
    .I3(\S<12>49_357 ),
    .O(S_12_OBUF_443)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<11>4  (
    .I0(AUX_5_addsub0000[11]),
    .I1(N2),
    .I2(_old_S_10[11]),
    .I3(N7),
    .O(\S<11>4_348 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<11>7  (
    .I0(\S<11>4_348 ),
    .I1(_AUX_9[11]),
    .I2(N01),
    .O(\S<11>7_351 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<11>11  (
    .I0(A_12_IBUF_35),
    .I1(N5),
    .O(\S<11>11_346 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<11>21  (
    .I0(B_11_IBUF_66),
    .I1(A_11_IBUF_34),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<11>21_347 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<11>40  (
    .I0(B_11_IBUF_66),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<11>40_349 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<11>49  (
    .I0(\S<11>11_346 ),
    .I1(A_11_IBUF_34),
    .I2(\S<11>40_349 ),
    .I3(\S<11>21_347 ),
    .O(\S<11>49_350 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<11>74  (
    .I0(\S<11>7_351 ),
    .I1(A_10_IBUF_33),
    .I2(N3),
    .I3(\S<11>49_350 ),
    .O(S_11_OBUF_442)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<10>4  (
    .I0(AUX_5_addsub0000[10]),
    .I1(N2),
    .I2(_old_S_10[10]),
    .I3(N7),
    .O(\S<10>4_341 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<10>7  (
    .I0(\S<10>4_341 ),
    .I1(_AUX_9[10]),
    .I2(N01),
    .O(\S<10>7_344 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \S<10>111  (
    .I0(A_11_IBUF_34),
    .I1(N5),
    .O(\S<10>11 )
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \S<10>21  (
    .I0(B_10_IBUF_65),
    .I1(A_10_IBUF_33),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(CLFZN_4_cmp_eq0009),
    .O(\S<10>21_340 )
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  \S<10>40  (
    .I0(B_10_IBUF_65),
    .I1(CLFZN_4_cmp_eq0008),
    .I2(CLFZN_4_cmp_eq0010),
    .I3(N18),
    .O(\S<10>40_342 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<10>49  (
    .I0(\S<10>11 ),
    .I1(A_10_IBUF_33),
    .I2(\S<10>40_342 ),
    .I3(\S<10>21_340 ),
    .O(\S<10>49_343 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<10>74  (
    .I0(\S<10>7_344 ),
    .I1(A_9_IBUF_47),
    .I2(N3),
    .I3(\S<10>49_343 ),
    .O(S_10_OBUF_441)
  );
  LUT4 #(
    .INIT ( 16'h0068 ))
  \S<15>45  (
    .I0(A_15_IBUF_38),
    .I1(B_15_IBUF_70),
    .I2(opext_1_IBUF_504),
    .I3(opext_3_IBUF_506),
    .O(\S<15>45_374 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<15>61  (
    .I0(B_15_IBUF_70),
    .I1(CLFZN_4_cmp_eq0009),
    .I2(N10),
    .I3(\S<15>45_374 ),
    .O(\S<15>61_375 )
  );
  LUT4 #(
    .INIT ( 16'hAA80 ))
  \S<15>79  (
    .I0(_old_S_10[15]),
    .I1(N411),
    .I2(opcode_0_IBUF_495),
    .I3(CLFZN_4_cmp_eq0005),
    .O(\S<15>79_376 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<15>95  (
    .I0(\S<15>61_375 ),
    .I1(AUX_5_addsub0000[15]),
    .I2(N2),
    .I3(\S<15>79_376 ),
    .O(\S<15>95_377 )
  );
  LUT4 #(
    .INIT ( 16'hAA80 ))
  \S<15>110  (
    .I0(A_15_IBUF_38),
    .I1(N38),
    .I2(N9),
    .I3(N18),
    .O(\S<15>110_372 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<15>125  (
    .I0(\S<15>95_377 ),
    .I1(_AUX_9[15]),
    .I2(N01),
    .I3(\S<15>110_372 ),
    .O(\S<15>125_373 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \S<15>136  (
    .I0(\S<15>125_373 ),
    .I1(A_14_IBUF_37),
    .I2(N3),
    .O(S_15_OBUF_446)
  );
  IBUF   carry_IBUF (
    .I(carry),
    .O(carry_IBUF_490)
  );
  IBUF   opext_3_IBUF (
    .I(opext[3]),
    .O(opext_3_IBUF_506)
  );
  IBUF   opext_2_IBUF (
    .I(opext[2]),
    .O(opext_2_IBUF_505)
  );
  IBUF   opext_1_IBUF (
    .I(opext[1]),
    .O(opext_1_IBUF_504)
  );
  IBUF   opext_0_IBUF (
    .I(opext[0]),
    .O(opext_0_IBUF_503)
  );
  IBUF   A_15_IBUF (
    .I(A[15]),
    .O(A_15_IBUF_38)
  );
  IBUF   A_14_IBUF (
    .I(A[14]),
    .O(A_14_IBUF_37)
  );
  IBUF   A_13_IBUF (
    .I(A[13]),
    .O(A_13_IBUF_36)
  );
  IBUF   A_12_IBUF (
    .I(A[12]),
    .O(A_12_IBUF_35)
  );
  IBUF   A_11_IBUF (
    .I(A[11]),
    .O(A_11_IBUF_34)
  );
  IBUF   A_10_IBUF (
    .I(A[10]),
    .O(A_10_IBUF_33)
  );
  IBUF   A_9_IBUF (
    .I(A[9]),
    .O(A_9_IBUF_47)
  );
  IBUF   A_8_IBUF (
    .I(A[8]),
    .O(A_8_IBUF_46)
  );
  IBUF   A_7_IBUF (
    .I(A[7]),
    .O(A_7_IBUF_45)
  );
  IBUF   A_6_IBUF (
    .I(A[6]),
    .O(A_6_IBUF_44)
  );
  IBUF   A_5_IBUF (
    .I(A[5]),
    .O(A_5_IBUF_43)
  );
  IBUF   A_4_IBUF (
    .I(A[4]),
    .O(A_4_IBUF_42)
  );
  IBUF   A_3_IBUF (
    .I(A[3]),
    .O(A_3_IBUF_41)
  );
  IBUF   A_2_IBUF (
    .I(A[2]),
    .O(A_2_IBUF_40)
  );
  IBUF   A_1_IBUF (
    .I(A[1]),
    .O(A_1_IBUF_39)
  );
  IBUF   A_0_IBUF (
    .I(A[0]),
    .O(A_0_IBUF_32)
  );
  IBUF   B_15_IBUF (
    .I(B[15]),
    .O(B_15_IBUF_70)
  );
  IBUF   B_14_IBUF (
    .I(B[14]),
    .O(B_14_IBUF_69)
  );
  IBUF   B_13_IBUF (
    .I(B[13]),
    .O(B_13_IBUF_68)
  );
  IBUF   B_12_IBUF (
    .I(B[12]),
    .O(B_12_IBUF_67)
  );
  IBUF   B_11_IBUF (
    .I(B[11]),
    .O(B_11_IBUF_66)
  );
  IBUF   B_10_IBUF (
    .I(B[10]),
    .O(B_10_IBUF_65)
  );
  IBUF   B_9_IBUF (
    .I(B[9]),
    .O(B_9_IBUF_79)
  );
  IBUF   B_8_IBUF (
    .I(B[8]),
    .O(B_8_IBUF_78)
  );
  IBUF   B_7_IBUF (
    .I(B[7]),
    .O(B_7_IBUF_77)
  );
  IBUF   B_6_IBUF (
    .I(B[6]),
    .O(B_6_IBUF_76)
  );
  IBUF   B_5_IBUF (
    .I(B[5]),
    .O(B_5_IBUF_75)
  );
  IBUF   B_4_IBUF (
    .I(B[4]),
    .O(B_4_IBUF_74)
  );
  IBUF   B_3_IBUF (
    .I(B[3]),
    .O(B_3_IBUF_73)
  );
  IBUF   B_2_IBUF (
    .I(B[2]),
    .O(B_2_IBUF_72)
  );
  IBUF   B_1_IBUF (
    .I(B[1]),
    .O(B_1_IBUF_71)
  );
  IBUF   B_0_IBUF (
    .I(B[0]),
    .O(B_0_IBUF_64)
  );
  IBUF   opcode_3_IBUF (
    .I(opcode[3]),
    .O(opcode_3_IBUF_498)
  );
  IBUF   opcode_2_IBUF (
    .I(opcode[2]),
    .O(opcode_2_IBUF_497)
  );
  IBUF   opcode_1_IBUF (
    .I(opcode[1]),
    .O(opcode_1_IBUF_496)
  );
  IBUF   opcode_0_IBUF (
    .I(opcode[0]),
    .O(opcode_0_IBUF_495)
  );
  OBUF   S_15_OBUF (
    .I(S_15_OBUF_446),
    .O(S[15])
  );
  OBUF   S_14_OBUF (
    .I(S_14_OBUF_445),
    .O(S[14])
  );
  OBUF   S_13_OBUF (
    .I(S_13_OBUF_444),
    .O(S[13])
  );
  OBUF   S_12_OBUF (
    .I(S_12_OBUF_443),
    .O(S[12])
  );
  OBUF   S_11_OBUF (
    .I(S_11_OBUF_442),
    .O(S[11])
  );
  OBUF   S_10_OBUF (
    .I(S_10_OBUF_441),
    .O(S[10])
  );
  OBUF   S_9_OBUF (
    .I(S_9_OBUF_455),
    .O(S[9])
  );
  OBUF   S_8_OBUF (
    .I(S_8_OBUF_454),
    .O(S[8])
  );
  OBUF   S_7_OBUF (
    .I(S_7_OBUF_453),
    .O(S[7])
  );
  OBUF   S_6_OBUF (
    .I(S_6_OBUF_452),
    .O(S[6])
  );
  OBUF   S_5_OBUF (
    .I(S_5_OBUF_451),
    .O(S[5])
  );
  OBUF   S_4_OBUF (
    .I(S_4_OBUF_450),
    .O(S[4])
  );
  OBUF   S_3_OBUF (
    .I(S_3_OBUF_449),
    .O(S[3])
  );
  OBUF   S_2_OBUF (
    .I(S_2_OBUF_448),
    .O(S[2])
  );
  OBUF   S_1_OBUF (
    .I(S_1_OBUF_447),
    .O(S[1])
  );
  OBUF   S_0_OBUF (
    .I(S_0_OBUF_440),
    .O(S[0])
  );
  OBUF   CLFZN_4_OBUF (
    .I(CLFZN_4_OBUF_98),
    .O(CLFZN[4])
  );
  OBUF   CLFZN_3_OBUF (
    .I(CLFZN_3_OBUF_97),
    .O(CLFZN[3])
  );
  OBUF   CLFZN_2_OBUF (
    .I(CLFZN_2_OBUF_88),
    .O(CLFZN[2])
  );
  OBUF   CLFZN_1_OBUF (
    .I(CLFZN_1_OBUF_87),
    .O(CLFZN[1])
  );
  OBUF   CLFZN_0_OBUF (
    .I(CLFZN_0_OBUF_85),
    .O(CLFZN[0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<1>_rt  (
    .I0(AUX_5_addsub0000[1]),
    .O(\Madd__AUX_9_cy<1>_rt_156 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<2>_rt  (
    .I0(AUX_5_addsub0000[2]),
    .O(\Madd__AUX_9_cy<2>_rt_158 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<3>_rt  (
    .I0(AUX_5_addsub0000[3]),
    .O(\Madd__AUX_9_cy<3>_rt_160 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<4>_rt  (
    .I0(AUX_5_addsub0000[4]),
    .O(\Madd__AUX_9_cy<4>_rt_162 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<5>_rt  (
    .I0(AUX_5_addsub0000[5]),
    .O(\Madd__AUX_9_cy<5>_rt_164 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<6>_rt  (
    .I0(AUX_5_addsub0000[6]),
    .O(\Madd__AUX_9_cy<6>_rt_166 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<7>_rt  (
    .I0(AUX_5_addsub0000[7]),
    .O(\Madd__AUX_9_cy<7>_rt_168 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<8>_rt  (
    .I0(AUX_5_addsub0000[8]),
    .O(\Madd__AUX_9_cy<8>_rt_170 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<9>_rt  (
    .I0(AUX_5_addsub0000[9]),
    .O(\Madd__AUX_9_cy<9>_rt_172 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<10>_rt  (
    .I0(AUX_5_addsub0000[10]),
    .O(\Madd__AUX_9_cy<10>_rt_144 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<11>_rt  (
    .I0(AUX_5_addsub0000[11]),
    .O(\Madd__AUX_9_cy<11>_rt_146 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<12>_rt  (
    .I0(AUX_5_addsub0000[12]),
    .O(\Madd__AUX_9_cy<12>_rt_148 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<13>_rt  (
    .I0(AUX_5_addsub0000[13]),
    .O(\Madd__AUX_9_cy<13>_rt_150 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<14>_rt  (
    .I0(AUX_5_addsub0000[14]),
    .O(\Madd__AUX_9_cy<14>_rt_152 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_cy<15>_rt  (
    .I0(AUX_5_addsub0000[15]),
    .O(\Madd__AUX_9_cy<15>_rt_154 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd__AUX_9_xor<16>_rt  (
    .I0(Madd_AUX_5_index0000),
    .O(\Madd__AUX_9_xor<16>_rt_174 )
  );
  LUT4 #(
    .INIT ( 16'hFF31 ))
  \S<10>1167_SW0  (
    .I0(N38),
    .I1(\S<10>1116_338 ),
    .I2(opext_3_IBUF_506),
    .I3(opcode_0_IBUF_495),
    .O(N55)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  \S<10>1167  (
    .I0(N39),
    .I1(opext_1_IBUF_504),
    .I2(N411),
    .I3(N55),
    .O(N3)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \S<14>32  (
    .I0(A_14_IBUF_37),
    .I1(N18),
    .I2(N57),
    .O(\S<14>32_368 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  CLFZN_3_mux00001 (
    .I0(Mcompar_CLFZN_cmp_gt0000_cy[15]),
    .I1(N11),
    .O(CLFZN_3_OBUF_97)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  CLFZN_0_mux00001 (
    .I0(Mcompar_CLFZN_cmp_gt0001_cy[15]),
    .I1(N11),
    .O(CLFZN_0_OBUF_85)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<0>271_SW0  (
    .I0(\S<0>4_331 ),
    .I1(N7),
    .I2(_old_S_10[0]),
    .I3(\S<0>258_329 ),
    .O(N59)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<0>271  (
    .I0(\S<0>136_324 ),
    .I1(N01),
    .I2(_AUX_9[0]),
    .I3(N59),
    .O(S_0_OBUF_440)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  CLFZN_2_mux0001185_SW0 (
    .I0(CLFZN_2_mux000121_93),
    .I1(CLFZN_4_cmp_eq0004),
    .I2(_AUX_9[16]),
    .I3(CLFZN_2_mux000170_96),
    .O(N61)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  CLFZN_2_mux0001185 (
    .I0(CLFZN_2_mux0001124_90),
    .I1(CLFZN_2_mux0001153_91),
    .I2(CLFZN_2_mux0001172_92),
    .I3(N61),
    .O(CLFZN_2_OBUF_88)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \S<7>61_SW0  (
    .I0(N01),
    .I1(_AUX_9[7]),
    .I2(N7),
    .I3(_old_S_10[7]),
    .O(N63)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<7>61  (
    .I0(\S<7>49_424 ),
    .I1(AUX_5_addsub0000[7]),
    .I2(N2),
    .I3(N63),
    .O(\S<7>61_425 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<14>80_SW0  (
    .I0(\S<14>53_369 ),
    .I1(N01),
    .I2(_AUX_9[14]),
    .I3(\S<14>32_368 ),
    .O(N65)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<14>80  (
    .I0(\S<14>13_367 ),
    .I1(A_13_IBUF_36),
    .I2(N3),
    .I3(N65),
    .O(S_14_OBUF_445)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<10>179_SW0  (
    .I0(CLFZN_4_cmp_eq0013),
    .I1(N38),
    .I2(N9),
    .I3(CLFZN_4_cmp_eq0016),
    .O(N67)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \S<0>4_SW1  (
    .I0(opcode_2_IBUF_497),
    .I1(opcode_1_IBUF_496),
    .I2(opcode_0_IBUF_495),
    .I3(opcode_3_IBUF_498),
    .O(N69)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<0>4  (
    .I0(CLFZN_4_cmp_eq0013),
    .I1(N38),
    .I2(N9),
    .I3(N69),
    .O(N5)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \S<0>136_SW0  (
    .I0(opext_0_IBUF_503),
    .I1(\S<0>89_335 ),
    .I2(opext_2_IBUF_505),
    .I3(N9),
    .O(N71)
  );
  LUT4 #(
    .INIT ( 16'h0A08 ))
  \S<0>136  (
    .I0(opext_1_IBUF_504),
    .I1(\S<0>17_325 ),
    .I2(A_0_IBUF_32),
    .I3(N71),
    .O(\S<0>136_324 )
  );
  LUT4 #(
    .INIT ( 16'h0220 ))
  \S<0>2_SW1  (
    .I0(opcode_2_IBUF_497),
    .I1(opcode_3_IBUF_498),
    .I2(opcode_1_IBUF_496),
    .I3(opcode_0_IBUF_495),
    .O(N73)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<0>2  (
    .I0(CLFZN_4_cmp_eq0001),
    .I1(N36),
    .I2(N44),
    .I3(N73),
    .O(N2)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  CLFZN_2_mux000112 (
    .I0(N36),
    .I1(N44),
    .I2(B_15_IBUF_70),
    .I3(A_15_IBUF_38),
    .O(CLFZN_2_mux000112_89)
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  CLFZN_2_mux000170 (
    .I0(AUX_5_addsub0000[15]),
    .I1(A_15_IBUF_38),
    .I2(N75),
    .I3(CLFZN_2_mux000155_95),
    .O(CLFZN_2_mux000170_96)
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  CLFZN_4_cmp_eq00091 (
    .I0(opext_0_IBUF_503),
    .I1(opext_1_IBUF_504),
    .I2(opext_2_IBUF_505),
    .I3(N44),
    .O(CLFZN_4_cmp_eq0009)
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  CLFZN_0_mux0000120_SW0 (
    .I0(opext_0_IBUF_503),
    .I1(N9),
    .I2(N8),
    .I3(opext_3_IBUF_506),
    .O(N77)
  );
  LUT4 #(
    .INIT ( 16'hBAAA ))
  CLFZN_0_mux0000120 (
    .I0(CLFZN_0_mux000018_86),
    .I1(opext_2_IBUF_505),
    .I2(opext_1_IBUF_504),
    .I3(N77),
    .O(N11)
  );
  LUT4 #(
    .INIT ( 16'h4412 ))
  \S<0>217_SW0  (
    .I0(opext_1_IBUF_504),
    .I1(opext_2_IBUF_505),
    .I2(B_0_IBUF_64),
    .I3(opext_3_IBUF_506),
    .O(N81)
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \S<0>217  (
    .I0(\S<0>182_326 ),
    .I1(N8),
    .I2(opext_0_IBUF_503),
    .I3(N81),
    .O(\S<0>217_327 )
  );
  LUT4 #(
    .INIT ( 16'h0220 ))
  \S<14>32_SW0  (
    .I0(N10),
    .I1(opext_3_IBUF_506),
    .I2(opext_1_IBUF_504),
    .I3(B_14_IBUF_69),
    .O(N57)
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  CLFZN_2_mux000170_SW0 (
    .I0(opext_3_IBUF_506),
    .I1(N36),
    .I2(B_15_IBUF_70),
    .I3(N8),
    .O(N75)
  );
  LUT4 #(
    .INIT ( 16'hFBBB ))
  \S<10>1116_SW1  (
    .I0(N67),
    .I1(\S<10>144_339 ),
    .I2(N39),
    .I3(opext_1_IBUF_504),
    .O(N89)
  );
  LUT4 #(
    .INIT ( 16'h2E2A ))
  \S<10>1116_SW0  (
    .I0(opext_0_IBUF_503),
    .I1(opext_2_IBUF_505),
    .I2(opext_3_IBUF_506),
    .I3(opext_1_IBUF_504),
    .O(N91)
  );
  LUT3 #(
    .INIT ( 8'h13 ))
  \S<10>1116  (
    .I0(N8),
    .I1(N89),
    .I2(N91),
    .O(\S<10>1116_338 )
  );
  MUXF5   \S<10>144  (
    .I0(N93),
    .I1(N94),
    .S(opext_1_IBUF_504),
    .O(\S<10>144_339 )
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \S<10>144_F  (
    .I0(N9),
    .I1(opext_0_IBUF_503),
    .I2(opext_2_IBUF_505),
    .O(N93)
  );
  LUT4 #(
    .INIT ( 16'hFF31 ))
  \S<10>144_G  (
    .I0(N44),
    .I1(N9),
    .I2(opext_2_IBUF_505),
    .I3(opext_0_IBUF_503),
    .O(N94)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  CLFZN_4_cmp_eq00131 (
    .I0(opext_2_IBUF_505),
    .I1(opext_1_IBUF_504),
    .I2(opext_0_IBUF_503),
    .I3(N8),
    .O(CLFZN_4_cmp_eq00131_108)
  );
  MUXF5   CLFZN_4_cmp_eq0013_f5 (
    .I0(N0),
    .I1(CLFZN_4_cmp_eq00131_108),
    .S(opext_3_IBUF_506),
    .O(CLFZN_4_cmp_eq0013)
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  CLFZN_4_cmp_eq000311 (
    .I0(opcode_2_IBUF_497),
    .I1(opcode_1_IBUF_496),
    .I2(opcode_0_IBUF_495),
    .I3(opcode_3_IBUF_498),
    .O(CLFZN_4_cmp_eq00031)
  );
  MUXF5   CLFZN_4_cmp_eq00031_f5 (
    .I0(CLFZN_4_cmp_eq00031),
    .I1(N0),
    .S(opext_3_IBUF_506),
    .O(N9)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<6>731  (
    .I0(\S<6>4_416 ),
    .I1(A_5_IBUF_43),
    .I2(N3),
    .I3(\S<6>18_415 ),
    .O(\S<6>73 )
  );
  MUXF5   \S<6>73_f5  (
    .I0(\S<6>73 ),
    .I1(N1),
    .S(\S<6>54_418 ),
    .O(S_6_OBUF_452)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \S<5>731  (
    .I0(\S<5>4_409 ),
    .I1(A_4_IBUF_42),
    .I2(N3),
    .I3(\S<5>18_408 ),
    .O(\S<5>73 )
  );
  MUXF5   \S<5>73_f5  (
    .I0(\S<5>73 ),
    .I1(N1),
    .S(\S<5>54_411 ),
    .O(S_5_OBUF_451)
  );
endmodule

/*
`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif
*/

