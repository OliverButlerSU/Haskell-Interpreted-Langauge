{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,105) ([512,3072,64,384,32,0,1,6,49150,512,0,0,0,64,0,2,12,32764,1,0,256,0,32,0,4,32768,0,4096,0,512,0,64,0,8,0,1,8192,0,1024,0,128,0,16,0,0,32768,0,2048,12288,0,0,0,0,65472,23,65528,2,24575,57344,3071,64512,383,65408,47,65520,5,49150,49152,6143,63488,767,65280,95,65504,11,32764,1,0,2048,0,256,0,32,0,4,8192,0,1024,0,128,0,16,0,8,16384,0,2048,0,256,0,32,0,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,80,0,10,0,65520,5,49150,2048,0,256,0,32,0,0,20480,0,4096,0,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","MultiExp","Exp","ExpInt","ExpTile","int","'='","'('","')'","';'","','","combineTilesRight","combineTilesDown","duplicateTileRight","duplicateTileDown","rotateTile90Degrees","rotateTile180Degrees","rotateTile270Degrees","squareRotateTile","scaleTile","createBlankTile","reflectTileX","reflectTileY","reflectTileXY","print","tileVar","%eof"]
        bit_start = st Prelude.* 29
        bit_end = (st Prelude.+ 1) Prelude.* 29
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..28]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_3
action_0 (27) = happyShift action_4
action_0 (28) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_3
action_1 (27) = happyShift action_4
action_1 (28) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (12) = happyShift action_26
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (10) = happyShift action_3
action_3 (27) = happyShift action_4
action_3 (28) = happyShift action_5
action_3 (5) = happyGoto action_25
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (14) = happyShift action_11
action_4 (15) = happyShift action_12
action_4 (16) = happyShift action_13
action_4 (17) = happyShift action_14
action_4 (18) = happyShift action_15
action_4 (19) = happyShift action_16
action_4 (20) = happyShift action_17
action_4 (21) = happyShift action_18
action_4 (22) = happyShift action_19
action_4 (23) = happyShift action_20
action_4 (24) = happyShift action_21
action_4 (25) = happyShift action_22
action_4 (26) = happyShift action_23
action_4 (28) = happyShift action_24
action_4 (7) = happyGoto action_10
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (9) = happyShift action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (29) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (12) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (10) = happyShift action_3
action_8 (27) = happyShift action_4
action_8 (28) = happyShift action_5
action_8 (4) = happyGoto action_27
action_8 (5) = happyGoto action_7
action_8 _ = happyReduce_2

action_9 (14) = happyShift action_11
action_9 (15) = happyShift action_12
action_9 (16) = happyShift action_13
action_9 (17) = happyShift action_14
action_9 (18) = happyShift action_15
action_9 (19) = happyShift action_16
action_9 (20) = happyShift action_17
action_9 (21) = happyShift action_18
action_9 (22) = happyShift action_19
action_9 (23) = happyShift action_20
action_9 (24) = happyShift action_21
action_9 (25) = happyShift action_22
action_9 (26) = happyShift action_23
action_9 (28) = happyShift action_24
action_9 (7) = happyGoto action_42
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_5

action_11 (10) = happyShift action_41
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_40
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (10) = happyShift action_39
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_38
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (10) = happyShift action_37
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_36
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_35
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_34
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (10) = happyShift action_33
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (10) = happyShift action_32
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_31
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_30
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (10) = happyShift action_29
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_8

action_25 (11) = happyShift action_28
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (10) = happyShift action_3
action_26 (27) = happyShift action_4
action_26 (28) = happyShift action_5
action_26 (4) = happyGoto action_27
action_26 (5) = happyGoto action_7
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_1

action_28 _ = happyReduce_3

action_29 (14) = happyShift action_11
action_29 (15) = happyShift action_12
action_29 (16) = happyShift action_13
action_29 (17) = happyShift action_14
action_29 (18) = happyShift action_15
action_29 (19) = happyShift action_16
action_29 (20) = happyShift action_17
action_29 (21) = happyShift action_18
action_29 (22) = happyShift action_19
action_29 (23) = happyShift action_20
action_29 (24) = happyShift action_21
action_29 (25) = happyShift action_22
action_29 (26) = happyShift action_23
action_29 (28) = happyShift action_24
action_29 (7) = happyGoto action_55
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (14) = happyShift action_11
action_30 (15) = happyShift action_12
action_30 (16) = happyShift action_13
action_30 (17) = happyShift action_14
action_30 (18) = happyShift action_15
action_30 (19) = happyShift action_16
action_30 (20) = happyShift action_17
action_30 (21) = happyShift action_18
action_30 (22) = happyShift action_19
action_30 (23) = happyShift action_20
action_30 (24) = happyShift action_21
action_30 (25) = happyShift action_22
action_30 (26) = happyShift action_23
action_30 (28) = happyShift action_24
action_30 (7) = happyGoto action_54
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (14) = happyShift action_11
action_31 (15) = happyShift action_12
action_31 (16) = happyShift action_13
action_31 (17) = happyShift action_14
action_31 (18) = happyShift action_15
action_31 (19) = happyShift action_16
action_31 (20) = happyShift action_17
action_31 (21) = happyShift action_18
action_31 (22) = happyShift action_19
action_31 (23) = happyShift action_20
action_31 (24) = happyShift action_21
action_31 (25) = happyShift action_22
action_31 (26) = happyShift action_23
action_31 (28) = happyShift action_24
action_31 (7) = happyGoto action_53
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (14) = happyShift action_11
action_32 (15) = happyShift action_12
action_32 (16) = happyShift action_13
action_32 (17) = happyShift action_14
action_32 (18) = happyShift action_15
action_32 (19) = happyShift action_16
action_32 (20) = happyShift action_17
action_32 (21) = happyShift action_18
action_32 (22) = happyShift action_19
action_32 (23) = happyShift action_20
action_32 (24) = happyShift action_21
action_32 (25) = happyShift action_22
action_32 (26) = happyShift action_23
action_32 (28) = happyShift action_24
action_32 (7) = happyGoto action_52
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (14) = happyShift action_11
action_33 (15) = happyShift action_12
action_33 (16) = happyShift action_13
action_33 (17) = happyShift action_14
action_33 (18) = happyShift action_15
action_33 (19) = happyShift action_16
action_33 (20) = happyShift action_17
action_33 (21) = happyShift action_18
action_33 (22) = happyShift action_19
action_33 (23) = happyShift action_20
action_33 (24) = happyShift action_21
action_33 (25) = happyShift action_22
action_33 (26) = happyShift action_23
action_33 (28) = happyShift action_24
action_33 (7) = happyGoto action_51
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (14) = happyShift action_11
action_34 (15) = happyShift action_12
action_34 (16) = happyShift action_13
action_34 (17) = happyShift action_14
action_34 (18) = happyShift action_15
action_34 (19) = happyShift action_16
action_34 (20) = happyShift action_17
action_34 (21) = happyShift action_18
action_34 (22) = happyShift action_19
action_34 (23) = happyShift action_20
action_34 (24) = happyShift action_21
action_34 (25) = happyShift action_22
action_34 (26) = happyShift action_23
action_34 (28) = happyShift action_24
action_34 (7) = happyGoto action_50
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (14) = happyShift action_11
action_35 (15) = happyShift action_12
action_35 (16) = happyShift action_13
action_35 (17) = happyShift action_14
action_35 (18) = happyShift action_15
action_35 (19) = happyShift action_16
action_35 (20) = happyShift action_17
action_35 (21) = happyShift action_18
action_35 (22) = happyShift action_19
action_35 (23) = happyShift action_20
action_35 (24) = happyShift action_21
action_35 (25) = happyShift action_22
action_35 (26) = happyShift action_23
action_35 (28) = happyShift action_24
action_35 (7) = happyGoto action_49
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (14) = happyShift action_11
action_36 (15) = happyShift action_12
action_36 (16) = happyShift action_13
action_36 (17) = happyShift action_14
action_36 (18) = happyShift action_15
action_36 (19) = happyShift action_16
action_36 (20) = happyShift action_17
action_36 (21) = happyShift action_18
action_36 (22) = happyShift action_19
action_36 (23) = happyShift action_20
action_36 (24) = happyShift action_21
action_36 (25) = happyShift action_22
action_36 (26) = happyShift action_23
action_36 (28) = happyShift action_24
action_36 (7) = happyGoto action_48
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (14) = happyShift action_11
action_37 (15) = happyShift action_12
action_37 (16) = happyShift action_13
action_37 (17) = happyShift action_14
action_37 (18) = happyShift action_15
action_37 (19) = happyShift action_16
action_37 (20) = happyShift action_17
action_37 (21) = happyShift action_18
action_37 (22) = happyShift action_19
action_37 (23) = happyShift action_20
action_37 (24) = happyShift action_21
action_37 (25) = happyShift action_22
action_37 (26) = happyShift action_23
action_37 (28) = happyShift action_24
action_37 (7) = happyGoto action_47
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (14) = happyShift action_11
action_38 (15) = happyShift action_12
action_38 (16) = happyShift action_13
action_38 (17) = happyShift action_14
action_38 (18) = happyShift action_15
action_38 (19) = happyShift action_16
action_38 (20) = happyShift action_17
action_38 (21) = happyShift action_18
action_38 (22) = happyShift action_19
action_38 (23) = happyShift action_20
action_38 (24) = happyShift action_21
action_38 (25) = happyShift action_22
action_38 (26) = happyShift action_23
action_38 (28) = happyShift action_24
action_38 (7) = happyGoto action_46
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (14) = happyShift action_11
action_39 (15) = happyShift action_12
action_39 (16) = happyShift action_13
action_39 (17) = happyShift action_14
action_39 (18) = happyShift action_15
action_39 (19) = happyShift action_16
action_39 (20) = happyShift action_17
action_39 (21) = happyShift action_18
action_39 (22) = happyShift action_19
action_39 (23) = happyShift action_20
action_39 (24) = happyShift action_21
action_39 (25) = happyShift action_22
action_39 (26) = happyShift action_23
action_39 (28) = happyShift action_24
action_39 (7) = happyGoto action_45
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (14) = happyShift action_11
action_40 (15) = happyShift action_12
action_40 (16) = happyShift action_13
action_40 (17) = happyShift action_14
action_40 (18) = happyShift action_15
action_40 (19) = happyShift action_16
action_40 (20) = happyShift action_17
action_40 (21) = happyShift action_18
action_40 (22) = happyShift action_19
action_40 (23) = happyShift action_20
action_40 (24) = happyShift action_21
action_40 (25) = happyShift action_22
action_40 (26) = happyShift action_23
action_40 (28) = happyShift action_24
action_40 (7) = happyGoto action_44
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (14) = happyShift action_11
action_41 (15) = happyShift action_12
action_41 (16) = happyShift action_13
action_41 (17) = happyShift action_14
action_41 (18) = happyShift action_15
action_41 (19) = happyShift action_16
action_41 (20) = happyShift action_17
action_41 (21) = happyShift action_18
action_41 (22) = happyShift action_19
action_41 (23) = happyShift action_20
action_41 (24) = happyShift action_21
action_41 (25) = happyShift action_22
action_41 (26) = happyShift action_23
action_41 (28) = happyShift action_24
action_41 (7) = happyGoto action_43
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_4

action_43 (13) = happyShift action_68
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (13) = happyShift action_67
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (13) = happyShift action_66
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (13) = happyShift action_65
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (11) = happyShift action_64
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (11) = happyShift action_63
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (11) = happyShift action_62
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (11) = happyShift action_61
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (13) = happyShift action_60
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (11) = happyShift action_59
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (11) = happyShift action_58
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (11) = happyShift action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (11) = happyShift action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_21

action_57 _ = happyReduce_20

action_58 _ = happyReduce_19

action_59 _ = happyReduce_18

action_60 (8) = happyShift action_72
action_60 (10) = happyShift action_73
action_60 (6) = happyGoto action_75
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_16

action_62 _ = happyReduce_15

action_63 _ = happyReduce_14

action_64 _ = happyReduce_13

action_65 (8) = happyShift action_72
action_65 (10) = happyShift action_73
action_65 (6) = happyGoto action_74
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (8) = happyShift action_72
action_66 (10) = happyShift action_73
action_66 (6) = happyGoto action_71
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (14) = happyShift action_11
action_67 (15) = happyShift action_12
action_67 (16) = happyShift action_13
action_67 (17) = happyShift action_14
action_67 (18) = happyShift action_15
action_67 (19) = happyShift action_16
action_67 (20) = happyShift action_17
action_67 (21) = happyShift action_18
action_67 (22) = happyShift action_19
action_67 (23) = happyShift action_20
action_67 (24) = happyShift action_21
action_67 (25) = happyShift action_22
action_67 (26) = happyShift action_23
action_67 (28) = happyShift action_24
action_67 (7) = happyGoto action_70
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (14) = happyShift action_11
action_68 (15) = happyShift action_12
action_68 (16) = happyShift action_13
action_68 (17) = happyShift action_14
action_68 (18) = happyShift action_15
action_68 (19) = happyShift action_16
action_68 (20) = happyShift action_17
action_68 (21) = happyShift action_18
action_68 (22) = happyShift action_19
action_68 (23) = happyShift action_20
action_68 (24) = happyShift action_21
action_68 (25) = happyShift action_22
action_68 (26) = happyShift action_23
action_68 (28) = happyShift action_24
action_68 (7) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (11) = happyShift action_81
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (11) = happyShift action_80
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (11) = happyShift action_79
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_6

action_73 (8) = happyShift action_72
action_73 (10) = happyShift action_73
action_73 (6) = happyGoto action_78
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (11) = happyShift action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (11) = happyShift action_76
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_17

action_77 _ = happyReduce_12

action_78 (11) = happyShift action_82
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_11

action_80 _ = happyReduce_10

action_81 _ = happyReduce_9

action_82 _ = happyReduce_7

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

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenTileVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (ExpSetTileVar happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (ExpPrint happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (IntVal happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyTerminal (TokenTileVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (TileVar happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 6 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileCTR happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 7 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileCTD happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 6 7 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileDTR happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 6 7 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileDTD happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRT90 happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRT180 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRT270 happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 7 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileSRT happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 6 7 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileST happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 7 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileCBT happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 7 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRTX happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 7 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRTY happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 7 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (TileRTXY happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 29 29 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 8;
	TokenEq _ -> cont 9;
	TokenLParen _ -> cont 10;
	TokenRParen _ -> cont 11;
	TokenSemiColon _ -> cont 12;
	TokenComma _ -> cont 13;
	TokenCTR _ -> cont 14;
	TokenCTD _ -> cont 15;
	TokenDTR _ -> cont 16;
	TokenDTD _ -> cont 17;
	TokenRT90 _ -> cont 18;
	TokenRT180 _ -> cont 19;
	TokenRT270 _ -> cont 20;
	TokenSR _ -> cont 21;
	TokenST _ -> cont 22;
	TokenBlank _ -> cont 23;
	TokenRTX _ -> cont 24;
	TokenRTY _ -> cont 25;
	TokenRTXY _ -> cont 26;
	TokenPrint _ -> cont 27;
	TokenTileVar _ happy_dollar_dollar -> cont 28;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 29 tk tks = happyError' (tks, explist)
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
    deriving (Show,Eq)

data ExpInt = IntVal Int
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
