{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,252) ([2560,24576,57344,5120,49152,49152,1,2,0,0,0,0,40960,0,6,14,1,0,0,2,0,0,4,65408,79,0,0,128,8,0,0,0,0,0,1024,0,0,160,1536,3584,256,57344,5119,0,0,8192,0,0,0,2048,0,40959,4096,0,0,8192,0,0,16384,0,0,32768,0,0,0,1,0,0,2,0,0,4,0,0,8,0,0,16,0,0,32,0,0,64,0,0,128,0,0,256,0,0,0,0,0,1152,275,0,2304,550,0,8192,0,0,10240,32768,32769,3,0,0,0,0,0,32768,64512,3,0,1540,0,0,0,0,0,9737,2,0,0,0,0,0,0,0,12360,17,0,144,32,0,512,3,0,512,49152,10239,1024,32768,20479,2048,0,40959,4096,0,16382,8193,0,32764,16386,0,65528,32772,0,65520,9,1,65504,19,2,65472,39,4,65408,79,8,65280,159,16,65024,319,32,64512,639,128,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,1,0,0,2,0,0,4,0,32768,0,0,0,1,0,0,2,0,0,4,0,0,128,0,0,16,0,0,32,0,0,64,0,0,128,0,0,512,0,0,49440,68,0,33344,137,0,0,0,0,2304,512,0,0,0,0,20480,32640,0,32768,192,0,0,2,0,32768,0,0,0,1,0,32768,6,1,0,13,2,0,18,4,0,36,8,0,72,16,0,144,32,0,288,64,0,0,0,0,0,2048,0,0,4096,0,0,14336,0,0,28672,0,0,63488,0,36864,8192,0,0,57344,3,16384,32770,0,32768,4,1,0,9,2,0,20,192,448,0,0,0,0,0,0,256,496,0,0,0,0,0,0,0,1280,12288,28672,0,0,0,0,0,0,0,0,0,0,0,0,36864,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18,4,0,36,8,0,64,63488,1279,128,61440,2559,512,0,0,1024,0,0,2048,3968,0,4096,7936,0,8192,15872,0,0,1,0,0,2,0,0,61440,1,0,57344,3,0,49152,7,0,32768,15,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,2560,24576,57344,32768,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","MultiExp","Exp","ExpInt","ExpBool","ExpTile","int","doNothing","'='","'('","')'","'{'","'}'","';'","','","true","false","'&&'","'||'","'!'","'<'","'>'","'+'","'-'","'*'","'/'","'^'","if","while","else","combineTilesRight","combineTilesDown","duplicateTileRight","duplicateTileDown","rotateTile90Degrees","rotateTile180Degrees","rotateTile270Degrees","squareRotateTile","scaleTile","createBlankTile","reflectTileX","reflectTileY","reflectTileXY","print","getTileFile","tileVar","%eof"]
        bit_start = st Prelude.* 49
        bit_end = (st Prelude.+ 1) Prelude.* 49
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..48]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_3
action_0 (12) = happyShift action_4
action_0 (30) = happyShift action_5
action_0 (31) = happyShift action_6
action_0 (46) = happyShift action_7
action_0 (47) = happyShift action_8
action_0 (48) = happyShift action_9
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_3
action_1 (12) = happyShift action_4
action_1 (30) = happyShift action_5
action_1 (31) = happyShift action_6
action_1 (46) = happyShift action_7
action_1 (47) = happyShift action_8
action_1 (48) = happyShift action_9
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (16) = happyShift action_34
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_8

action_4 (10) = happyShift action_3
action_4 (12) = happyShift action_4
action_4 (30) = happyShift action_5
action_4 (31) = happyShift action_6
action_4 (46) = happyShift action_7
action_4 (47) = happyShift action_8
action_4 (48) = happyShift action_9
action_4 (5) = happyGoto action_33
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (12) = happyShift action_32
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (12) = happyShift action_31
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (12) = happyShift action_16
action_7 (33) = happyShift action_17
action_7 (34) = happyShift action_18
action_7 (35) = happyShift action_19
action_7 (36) = happyShift action_20
action_7 (37) = happyShift action_21
action_7 (38) = happyShift action_22
action_7 (39) = happyShift action_23
action_7 (40) = happyShift action_24
action_7 (41) = happyShift action_25
action_7 (42) = happyShift action_26
action_7 (43) = happyShift action_27
action_7 (44) = happyShift action_28
action_7 (45) = happyShift action_29
action_7 (48) = happyShift action_30
action_7 (8) = happyGoto action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (48) = happyShift action_14
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (11) = happyShift action_13
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (49) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (16) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_3
action_12 (12) = happyShift action_4
action_12 (30) = happyShift action_5
action_12 (31) = happyShift action_6
action_12 (46) = happyShift action_7
action_12 (47) = happyShift action_8
action_12 (48) = happyShift action_9
action_12 (4) = happyGoto action_35
action_12 (5) = happyGoto action_11
action_12 _ = happyReduce_2

action_13 (12) = happyShift action_16
action_13 (33) = happyShift action_17
action_13 (34) = happyShift action_18
action_13 (35) = happyShift action_19
action_13 (36) = happyShift action_20
action_13 (37) = happyShift action_21
action_13 (38) = happyShift action_22
action_13 (39) = happyShift action_23
action_13 (40) = happyShift action_24
action_13 (41) = happyShift action_25
action_13 (42) = happyShift action_26
action_13 (43) = happyShift action_27
action_13 (44) = happyShift action_28
action_13 (45) = happyShift action_29
action_13 (48) = happyShift action_30
action_13 (8) = happyGoto action_61
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (48) = happyShift action_60
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_7

action_16 (12) = happyShift action_16
action_16 (33) = happyShift action_17
action_16 (34) = happyShift action_18
action_16 (35) = happyShift action_19
action_16 (36) = happyShift action_20
action_16 (37) = happyShift action_21
action_16 (38) = happyShift action_22
action_16 (39) = happyShift action_23
action_16 (40) = happyShift action_24
action_16 (41) = happyShift action_25
action_16 (42) = happyShift action_26
action_16 (43) = happyShift action_27
action_16 (44) = happyShift action_28
action_16 (45) = happyShift action_29
action_16 (48) = happyShift action_30
action_16 (8) = happyGoto action_59
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (12) = happyShift action_58
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (12) = happyShift action_57
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (12) = happyShift action_56
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (12) = happyShift action_55
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (12) = happyShift action_54
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (12) = happyShift action_53
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (12) = happyShift action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (12) = happyShift action_51
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_50
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (12) = happyShift action_49
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (12) = happyShift action_48
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (12) = happyShift action_47
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (12) = happyShift action_46
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_30

action_31 (9) = happyShift action_39
action_31 (12) = happyShift action_40
action_31 (18) = happyShift action_41
action_31 (19) = happyShift action_42
action_31 (22) = happyShift action_43
action_31 (26) = happyShift action_44
action_31 (6) = happyGoto action_37
action_31 (7) = happyGoto action_45
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (9) = happyShift action_39
action_32 (12) = happyShift action_40
action_32 (18) = happyShift action_41
action_32 (19) = happyShift action_42
action_32 (22) = happyShift action_43
action_32 (26) = happyShift action_44
action_32 (6) = happyGoto action_37
action_32 (7) = happyGoto action_38
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (13) = happyShift action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_3
action_34 (12) = happyShift action_4
action_34 (30) = happyShift action_5
action_34 (31) = happyShift action_6
action_34 (46) = happyShift action_7
action_34 (47) = happyShift action_8
action_34 (48) = happyShift action_9
action_34 (4) = happyGoto action_35
action_34 (5) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_1

action_36 _ = happyReduce_3

action_37 (11) = happyShift action_85
action_37 (22) = happyShift action_86
action_37 (23) = happyShift action_87
action_37 (24) = happyShift action_88
action_37 (25) = happyShift action_89
action_37 (26) = happyShift action_90
action_37 (27) = happyShift action_91
action_37 (28) = happyShift action_92
action_37 (29) = happyShift action_93
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (13) = happyShift action_84
action_38 (20) = happyShift action_77
action_38 (21) = happyShift action_78
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_10

action_40 (9) = happyShift action_39
action_40 (12) = happyShift action_40
action_40 (18) = happyShift action_41
action_40 (19) = happyShift action_42
action_40 (22) = happyShift action_43
action_40 (26) = happyShift action_44
action_40 (6) = happyGoto action_82
action_40 (7) = happyGoto action_83
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_18

action_42 _ = happyReduce_19

action_43 (9) = happyShift action_39
action_43 (12) = happyShift action_40
action_43 (18) = happyShift action_41
action_43 (19) = happyShift action_42
action_43 (22) = happyShift action_43
action_43 (26) = happyShift action_44
action_43 (6) = happyGoto action_37
action_43 (7) = happyGoto action_81
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (9) = happyShift action_39
action_44 (12) = happyShift action_80
action_44 (26) = happyShift action_44
action_44 (6) = happyGoto action_79
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (13) = happyShift action_76
action_45 (20) = happyShift action_77
action_45 (21) = happyShift action_78
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (12) = happyShift action_16
action_46 (33) = happyShift action_17
action_46 (34) = happyShift action_18
action_46 (35) = happyShift action_19
action_46 (36) = happyShift action_20
action_46 (37) = happyShift action_21
action_46 (38) = happyShift action_22
action_46 (39) = happyShift action_23
action_46 (40) = happyShift action_24
action_46 (41) = happyShift action_25
action_46 (42) = happyShift action_26
action_46 (43) = happyShift action_27
action_46 (44) = happyShift action_28
action_46 (45) = happyShift action_29
action_46 (48) = happyShift action_30
action_46 (8) = happyGoto action_75
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (12) = happyShift action_16
action_47 (33) = happyShift action_17
action_47 (34) = happyShift action_18
action_47 (35) = happyShift action_19
action_47 (36) = happyShift action_20
action_47 (37) = happyShift action_21
action_47 (38) = happyShift action_22
action_47 (39) = happyShift action_23
action_47 (40) = happyShift action_24
action_47 (41) = happyShift action_25
action_47 (42) = happyShift action_26
action_47 (43) = happyShift action_27
action_47 (44) = happyShift action_28
action_47 (45) = happyShift action_29
action_47 (48) = happyShift action_30
action_47 (8) = happyGoto action_74
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (12) = happyShift action_16
action_48 (33) = happyShift action_17
action_48 (34) = happyShift action_18
action_48 (35) = happyShift action_19
action_48 (36) = happyShift action_20
action_48 (37) = happyShift action_21
action_48 (38) = happyShift action_22
action_48 (39) = happyShift action_23
action_48 (40) = happyShift action_24
action_48 (41) = happyShift action_25
action_48 (42) = happyShift action_26
action_48 (43) = happyShift action_27
action_48 (44) = happyShift action_28
action_48 (45) = happyShift action_29
action_48 (48) = happyShift action_30
action_48 (8) = happyGoto action_73
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (12) = happyShift action_16
action_49 (33) = happyShift action_17
action_49 (34) = happyShift action_18
action_49 (35) = happyShift action_19
action_49 (36) = happyShift action_20
action_49 (37) = happyShift action_21
action_49 (38) = happyShift action_22
action_49 (39) = happyShift action_23
action_49 (40) = happyShift action_24
action_49 (41) = happyShift action_25
action_49 (42) = happyShift action_26
action_49 (43) = happyShift action_27
action_49 (44) = happyShift action_28
action_49 (45) = happyShift action_29
action_49 (48) = happyShift action_30
action_49 (8) = happyGoto action_72
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (12) = happyShift action_16
action_50 (33) = happyShift action_17
action_50 (34) = happyShift action_18
action_50 (35) = happyShift action_19
action_50 (36) = happyShift action_20
action_50 (37) = happyShift action_21
action_50 (38) = happyShift action_22
action_50 (39) = happyShift action_23
action_50 (40) = happyShift action_24
action_50 (41) = happyShift action_25
action_50 (42) = happyShift action_26
action_50 (43) = happyShift action_27
action_50 (44) = happyShift action_28
action_50 (45) = happyShift action_29
action_50 (48) = happyShift action_30
action_50 (8) = happyGoto action_71
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (12) = happyShift action_16
action_51 (33) = happyShift action_17
action_51 (34) = happyShift action_18
action_51 (35) = happyShift action_19
action_51 (36) = happyShift action_20
action_51 (37) = happyShift action_21
action_51 (38) = happyShift action_22
action_51 (39) = happyShift action_23
action_51 (40) = happyShift action_24
action_51 (41) = happyShift action_25
action_51 (42) = happyShift action_26
action_51 (43) = happyShift action_27
action_51 (44) = happyShift action_28
action_51 (45) = happyShift action_29
action_51 (48) = happyShift action_30
action_51 (8) = happyGoto action_70
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (12) = happyShift action_16
action_52 (33) = happyShift action_17
action_52 (34) = happyShift action_18
action_52 (35) = happyShift action_19
action_52 (36) = happyShift action_20
action_52 (37) = happyShift action_21
action_52 (38) = happyShift action_22
action_52 (39) = happyShift action_23
action_52 (40) = happyShift action_24
action_52 (41) = happyShift action_25
action_52 (42) = happyShift action_26
action_52 (43) = happyShift action_27
action_52 (44) = happyShift action_28
action_52 (45) = happyShift action_29
action_52 (48) = happyShift action_30
action_52 (8) = happyGoto action_69
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (12) = happyShift action_16
action_53 (33) = happyShift action_17
action_53 (34) = happyShift action_18
action_53 (35) = happyShift action_19
action_53 (36) = happyShift action_20
action_53 (37) = happyShift action_21
action_53 (38) = happyShift action_22
action_53 (39) = happyShift action_23
action_53 (40) = happyShift action_24
action_53 (41) = happyShift action_25
action_53 (42) = happyShift action_26
action_53 (43) = happyShift action_27
action_53 (44) = happyShift action_28
action_53 (45) = happyShift action_29
action_53 (48) = happyShift action_30
action_53 (8) = happyGoto action_68
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (12) = happyShift action_16
action_54 (33) = happyShift action_17
action_54 (34) = happyShift action_18
action_54 (35) = happyShift action_19
action_54 (36) = happyShift action_20
action_54 (37) = happyShift action_21
action_54 (38) = happyShift action_22
action_54 (39) = happyShift action_23
action_54 (40) = happyShift action_24
action_54 (41) = happyShift action_25
action_54 (42) = happyShift action_26
action_54 (43) = happyShift action_27
action_54 (44) = happyShift action_28
action_54 (45) = happyShift action_29
action_54 (48) = happyShift action_30
action_54 (8) = happyGoto action_67
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (12) = happyShift action_16
action_55 (33) = happyShift action_17
action_55 (34) = happyShift action_18
action_55 (35) = happyShift action_19
action_55 (36) = happyShift action_20
action_55 (37) = happyShift action_21
action_55 (38) = happyShift action_22
action_55 (39) = happyShift action_23
action_55 (40) = happyShift action_24
action_55 (41) = happyShift action_25
action_55 (42) = happyShift action_26
action_55 (43) = happyShift action_27
action_55 (44) = happyShift action_28
action_55 (45) = happyShift action_29
action_55 (48) = happyShift action_30
action_55 (8) = happyGoto action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (12) = happyShift action_16
action_56 (33) = happyShift action_17
action_56 (34) = happyShift action_18
action_56 (35) = happyShift action_19
action_56 (36) = happyShift action_20
action_56 (37) = happyShift action_21
action_56 (38) = happyShift action_22
action_56 (39) = happyShift action_23
action_56 (40) = happyShift action_24
action_56 (41) = happyShift action_25
action_56 (42) = happyShift action_26
action_56 (43) = happyShift action_27
action_56 (44) = happyShift action_28
action_56 (45) = happyShift action_29
action_56 (48) = happyShift action_30
action_56 (8) = happyGoto action_65
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (12) = happyShift action_16
action_57 (33) = happyShift action_17
action_57 (34) = happyShift action_18
action_57 (35) = happyShift action_19
action_57 (36) = happyShift action_20
action_57 (37) = happyShift action_21
action_57 (38) = happyShift action_22
action_57 (39) = happyShift action_23
action_57 (40) = happyShift action_24
action_57 (41) = happyShift action_25
action_57 (42) = happyShift action_26
action_57 (43) = happyShift action_27
action_57 (44) = happyShift action_28
action_57 (45) = happyShift action_29
action_57 (48) = happyShift action_30
action_57 (8) = happyGoto action_64
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (12) = happyShift action_16
action_58 (33) = happyShift action_17
action_58 (34) = happyShift action_18
action_58 (35) = happyShift action_19
action_58 (36) = happyShift action_20
action_58 (37) = happyShift action_21
action_58 (38) = happyShift action_22
action_58 (39) = happyShift action_23
action_58 (40) = happyShift action_24
action_58 (41) = happyShift action_25
action_58 (42) = happyShift action_26
action_58 (43) = happyShift action_27
action_58 (44) = happyShift action_28
action_58 (45) = happyShift action_29
action_58 (48) = happyShift action_30
action_58 (8) = happyGoto action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (13) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_9

action_61 _ = happyReduce_6

action_62 _ = happyReduce_44

action_63 (17) = happyShift action_124
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (17) = happyShift action_123
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (17) = happyShift action_122
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (17) = happyShift action_121
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (13) = happyShift action_120
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (13) = happyShift action_119
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (13) = happyShift action_118
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (13) = happyShift action_117
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (17) = happyShift action_116
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (13) = happyShift action_115
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (13) = happyShift action_114
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (13) = happyShift action_113
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (13) = happyShift action_112
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (14) = happyShift action_111
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (9) = happyShift action_39
action_77 (12) = happyShift action_40
action_77 (18) = happyShift action_41
action_77 (19) = happyShift action_42
action_77 (22) = happyShift action_43
action_77 (26) = happyShift action_44
action_77 (6) = happyGoto action_37
action_77 (7) = happyGoto action_110
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (9) = happyShift action_39
action_78 (12) = happyShift action_40
action_78 (18) = happyShift action_41
action_78 (19) = happyShift action_42
action_78 (22) = happyShift action_43
action_78 (26) = happyShift action_44
action_78 (6) = happyGoto action_37
action_78 (7) = happyGoto action_109
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_11

action_80 (9) = happyShift action_39
action_80 (12) = happyShift action_80
action_80 (26) = happyShift action_44
action_80 (6) = happyGoto action_108
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_22

action_82 (11) = happyShift action_85
action_82 (13) = happyShift action_107
action_82 (22) = happyShift action_86
action_82 (23) = happyShift action_87
action_82 (24) = happyShift action_88
action_82 (25) = happyShift action_89
action_82 (26) = happyShift action_90
action_82 (27) = happyShift action_91
action_82 (28) = happyShift action_92
action_82 (29) = happyShift action_93
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (13) = happyShift action_106
action_83 (20) = happyShift action_77
action_83 (21) = happyShift action_78
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (14) = happyShift action_105
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (11) = happyShift action_104
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (11) = happyShift action_103
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (9) = happyShift action_39
action_87 (11) = happyShift action_102
action_87 (12) = happyShift action_80
action_87 (26) = happyShift action_44
action_87 (6) = happyGoto action_101
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (9) = happyShift action_39
action_88 (11) = happyShift action_100
action_88 (12) = happyShift action_80
action_88 (26) = happyShift action_44
action_88 (6) = happyGoto action_99
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (9) = happyShift action_39
action_89 (12) = happyShift action_80
action_89 (26) = happyShift action_44
action_89 (6) = happyGoto action_98
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (9) = happyShift action_39
action_90 (12) = happyShift action_80
action_90 (26) = happyShift action_44
action_90 (6) = happyGoto action_97
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (9) = happyShift action_39
action_91 (12) = happyShift action_80
action_91 (26) = happyShift action_44
action_91 (6) = happyGoto action_96
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (9) = happyShift action_39
action_92 (12) = happyShift action_80
action_92 (26) = happyShift action_44
action_92 (6) = happyGoto action_95
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (9) = happyShift action_39
action_93 (12) = happyShift action_80
action_93 (26) = happyShift action_44
action_93 (6) = happyGoto action_94
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_16

action_95 (29) = happyShift action_93
action_95 _ = happyReduce_15

action_96 (29) = happyShift action_93
action_96 _ = happyReduce_14

action_97 (27) = happyShift action_91
action_97 (28) = happyShift action_92
action_97 (29) = happyShift action_93
action_97 _ = happyReduce_13

action_98 (27) = happyShift action_91
action_98 (28) = happyShift action_92
action_98 (29) = happyShift action_93
action_98 _ = happyReduce_12

action_99 (25) = happyShift action_89
action_99 (26) = happyShift action_90
action_99 (27) = happyShift action_91
action_99 (28) = happyShift action_92
action_99 (29) = happyShift action_93
action_99 _ = happyReduce_25

action_100 (9) = happyShift action_39
action_100 (12) = happyShift action_80
action_100 (26) = happyShift action_44
action_100 (6) = happyGoto action_135
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (25) = happyShift action_89
action_101 (26) = happyShift action_90
action_101 (27) = happyShift action_91
action_101 (28) = happyShift action_92
action_101 (29) = happyShift action_93
action_101 _ = happyReduce_23

action_102 (9) = happyShift action_39
action_102 (12) = happyShift action_80
action_102 (26) = happyShift action_44
action_102 (6) = happyGoto action_134
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (9) = happyShift action_39
action_103 (12) = happyShift action_80
action_103 (26) = happyShift action_44
action_103 (6) = happyGoto action_133
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (9) = happyShift action_39
action_104 (12) = happyShift action_80
action_104 (26) = happyShift action_44
action_104 (6) = happyGoto action_132
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (10) = happyShift action_3
action_105 (12) = happyShift action_4
action_105 (30) = happyShift action_5
action_105 (31) = happyShift action_6
action_105 (46) = happyShift action_7
action_105 (47) = happyShift action_8
action_105 (48) = happyShift action_9
action_105 (4) = happyGoto action_131
action_105 (5) = happyGoto action_11
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_29

action_107 _ = happyReduce_17

action_108 (13) = happyShift action_107
action_108 (25) = happyShift action_89
action_108 (26) = happyShift action_90
action_108 (27) = happyShift action_91
action_108 (28) = happyShift action_92
action_108 (29) = happyShift action_93
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_21

action_110 _ = happyReduce_20

action_111 (10) = happyShift action_3
action_111 (12) = happyShift action_4
action_111 (30) = happyShift action_5
action_111 (31) = happyShift action_6
action_111 (46) = happyShift action_7
action_111 (47) = happyShift action_8
action_111 (48) = happyShift action_9
action_111 (4) = happyGoto action_130
action_111 (5) = happyGoto action_11
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_43

action_113 _ = happyReduce_42

action_114 _ = happyReduce_41

action_115 _ = happyReduce_40

action_116 (9) = happyShift action_39
action_116 (12) = happyShift action_80
action_116 (26) = happyShift action_44
action_116 (6) = happyGoto action_129
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_38

action_118 _ = happyReduce_37

action_119 _ = happyReduce_36

action_120 _ = happyReduce_35

action_121 (9) = happyShift action_39
action_121 (12) = happyShift action_80
action_121 (26) = happyShift action_44
action_121 (6) = happyGoto action_128
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (9) = happyShift action_39
action_122 (12) = happyShift action_80
action_122 (26) = happyShift action_44
action_122 (6) = happyGoto action_127
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (12) = happyShift action_16
action_123 (33) = happyShift action_17
action_123 (34) = happyShift action_18
action_123 (35) = happyShift action_19
action_123 (36) = happyShift action_20
action_123 (37) = happyShift action_21
action_123 (38) = happyShift action_22
action_123 (39) = happyShift action_23
action_123 (40) = happyShift action_24
action_123 (41) = happyShift action_25
action_123 (42) = happyShift action_26
action_123 (43) = happyShift action_27
action_123 (44) = happyShift action_28
action_123 (45) = happyShift action_29
action_123 (48) = happyShift action_30
action_123 (8) = happyGoto action_126
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (12) = happyShift action_16
action_124 (33) = happyShift action_17
action_124 (34) = happyShift action_18
action_124 (35) = happyShift action_19
action_124 (36) = happyShift action_20
action_124 (37) = happyShift action_21
action_124 (38) = happyShift action_22
action_124 (39) = happyShift action_23
action_124 (40) = happyShift action_24
action_124 (41) = happyShift action_25
action_124 (42) = happyShift action_26
action_124 (43) = happyShift action_27
action_124 (44) = happyShift action_28
action_124 (45) = happyShift action_29
action_124 (48) = happyShift action_30
action_124 (8) = happyGoto action_125
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (13) = happyShift action_142
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (13) = happyShift action_141
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (13) = happyShift action_140
action_127 (25) = happyShift action_89
action_127 (26) = happyShift action_90
action_127 (27) = happyShift action_91
action_127 (28) = happyShift action_92
action_127 (29) = happyShift action_93
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (13) = happyShift action_139
action_128 (25) = happyShift action_89
action_128 (26) = happyShift action_90
action_128 (27) = happyShift action_91
action_128 (28) = happyShift action_92
action_128 (29) = happyShift action_93
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (13) = happyShift action_138
action_129 (25) = happyShift action_89
action_129 (26) = happyShift action_90
action_129 (27) = happyShift action_91
action_129 (28) = happyShift action_92
action_129 (29) = happyShift action_93
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (15) = happyShift action_137
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (15) = happyShift action_136
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (25) = happyShift action_89
action_132 (26) = happyShift action_90
action_132 (27) = happyShift action_91
action_132 (28) = happyShift action_92
action_132 (29) = happyShift action_93
action_132 _ = happyReduce_27

action_133 (25) = happyShift action_89
action_133 (26) = happyShift action_90
action_133 (27) = happyShift action_91
action_133 (28) = happyShift action_92
action_133 (29) = happyShift action_93
action_133 _ = happyReduce_28

action_134 (25) = happyShift action_89
action_134 (26) = happyShift action_90
action_134 (27) = happyShift action_91
action_134 (28) = happyShift action_92
action_134 (29) = happyShift action_93
action_134 _ = happyReduce_24

action_135 (25) = happyShift action_89
action_135 (26) = happyShift action_90
action_135 (27) = happyShift action_91
action_135 (28) = happyShift action_92
action_135 (29) = happyShift action_93
action_135 _ = happyReduce_26

action_136 (32) = happyShift action_143
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_5

action_138 _ = happyReduce_39

action_139 _ = happyReduce_34

action_140 _ = happyReduce_33

action_141 _ = happyReduce_32

action_142 _ = happyReduce_31

action_143 (14) = happyShift action_144
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (10) = happyShift action_3
action_144 (12) = happyShift action_4
action_144 (30) = happyShift action_5
action_144 (31) = happyShift action_6
action_144 (46) = happyShift action_7
action_144 (47) = happyShift action_8
action_144 (48) = happyShift action_9
action_144 (4) = happyGoto action_145
action_144 (5) = happyGoto action_11
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (15) = happyShift action_146
action_145 _ = happyFail (happyExpListPerState 145)

action_146 _ = happyReduce_4

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (MultiExpr happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 11 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ExpIf happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 7 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ExpWhile happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TokenTileVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (ExpSetTileVar happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (ExpPrint happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn5
		 (ExpDoNothing
	)

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyTerminal (TokenTileVar _ happy_var_3))
	(HappyTerminal (TokenTileVar _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (ExpGetTileFile happy_var_2 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (IntVal happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (IntNegate happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntPlus happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntMinus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntTimes happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntDivide happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntExponential happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn7
		 (BoolTrue
	)

happyReduce_19 = happySpecReduce_1  7 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn7
		 (BoolFalse
	)

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolAnd happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolOr happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  7 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (BoolNot happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolLessThan happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 7 happyReduction_24
happyReduction_24 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolLessEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolMoreThan happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 4 7 happyReduction_26
happyReduction_26 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolMoreEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 7 happyReduction_27
happyReduction_27 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 7 happyReduction_28
happyReduction_28 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolNotEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  8 happyReduction_30
happyReduction_30 (HappyTerminal (TokenTileVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (TileVar happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happyReduce 6 8 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileCTR happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 6 8 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileCTD happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 6 8 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileDTR happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 6 8 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileDTD happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 4 8 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRT90 happy_var_3
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 4 8 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRT180 happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 4 8 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRT270 happy_var_3
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 4 8 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileSRT happy_var_3
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 6 8 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileST happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 8 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileCBT happy_var_3
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 8 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRTX happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 8 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRTY happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 8 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TileRTXY happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_3  8 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 49 49 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 9;
	TokenDoNothing _ -> cont 10;
	TokenEq _ -> cont 11;
	TokenLParen _ -> cont 12;
	TokenRParen _ -> cont 13;
	TokenLSquig _ -> cont 14;
	TokenRSquig _ -> cont 15;
	TokenSemiColon _ -> cont 16;
	TokenComma _ -> cont 17;
	TokenTrue _ -> cont 18;
	TokenFalse _ -> cont 19;
	TokenAnd _ -> cont 20;
	TokenOr _ -> cont 21;
	TokenNot _ -> cont 22;
	TokenLessThan _ -> cont 23;
	TokenMoreThan _ -> cont 24;
	TokenPlus _ -> cont 25;
	TokenMinus _ -> cont 26;
	TokenTimes _ -> cont 27;
	TokenDiv _ -> cont 28;
	TokenExponential _ -> cont 29;
	TokenIf _ -> cont 30;
	TokenWhile _ -> cont 31;
	TokenElse _ -> cont 32;
	TokenCTR _ -> cont 33;
	TokenCTD _ -> cont 34;
	TokenDTR _ -> cont 35;
	TokenDTD _ -> cont 36;
	TokenRT90 _ -> cont 37;
	TokenRT180 _ -> cont 38;
	TokenRT270 _ -> cont 39;
	TokenSR _ -> cont 40;
	TokenST _ -> cont 41;
	TokenBlank _ -> cont 42;
	TokenRTX _ -> cont 43;
	TokenRTY _ -> cont 44;
	TokenRTXY _ -> cont 45;
	TokenPrint _ -> cont 46;
	TokenTileFile _ -> cont 47;
	TokenTileVar _ happy_dollar_dollar -> cont 48;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 49 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = ExpSetTileVar String ExpTile
         | MultiExpr Exp Exp
         | ExpPrint ExpTile
         | ExpIf ExpBool Exp Exp
         | ExpWhile ExpBool Exp
         | ExpDoNothing
         | ExpGetTileFile String String
    deriving (Show,Eq)

data ExpBool = BoolTrue
             | BoolFalse
             | BoolAnd ExpBool ExpBool
             | BoolOr ExpBool ExpBool
             | BoolNot ExpBool
             | BoolLessThan ExpInt ExpInt
             | BoolLessEqualThan ExpInt ExpInt
             | BoolMoreThan ExpInt ExpInt
             | BoolMoreEqualThan ExpInt ExpInt
             | BoolEqual ExpInt ExpInt
             | BoolNotEqual ExpInt ExpInt
    deriving (Show,Eq)

data ExpInt = IntVal Int
            | IntNegate ExpInt
            | IntPlus ExpInt ExpInt
            | IntMinus ExpInt ExpInt
            | IntTimes ExpInt ExpInt
            | IntDivide ExpInt ExpInt
            | IntExponential ExpInt ExpInt
    deriving (Show,Eq)

data ExpTile = TileVar String
             | TileCTR ExpTile ExpTile
             | TileCTD ExpTile ExpTile 
             | TileDTR ExpTile ExpInt 
             | TileDTD ExpTile ExpInt
             | TileRT90 ExpTile
             | TileRT180 ExpTile
             | TileRT270 ExpTile
             | TileSRT ExpTile
             | TileST ExpTile ExpInt
             | TileCBT ExpTile
             | TileRTX ExpTile
             | TileRTY ExpTile
             | TileRTXY ExpTile
    deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
