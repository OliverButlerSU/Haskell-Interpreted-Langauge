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
happyExpList = Happy_Data_Array.listArray (0,150) ([0,17072,0,17072,0,8192,0,512,0,512,0,0,0,17072,0,256,0,0,0,8192,0,17072,128,16897,0,1024,4992,16897,4992,16897,0,17072,0,0,61440,271,3072,1024,0,0,0,0,0,0,4992,16897,128,16897,4992,16897,0,0,3072,1024,0,0,32768,15,128,16897,32768,1039,128,16897,128,16897,128,16897,128,16897,128,16897,4992,16897,4992,16897,0,2048,61440,1295,3072,1024,0,0,0,0,0,2048,0,256,128,17153,128,17153,0,256,128,16897,32768,15,128,16897,32768,15,128,16897,128,16897,0,17072,0,0,0,0,0,17072,0,0,0,0,0,0,0,8,0,8,0,14,0,14,0,4096,0,4096,32768,15,32768,15,32768,15,32768,15,0,64,0,0,0,2048,0,17072,0,4096,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","MultiExp","Exp","ExpInt","ExpBool","int","true","false","'&&'","'||'","'!'","'<'","'>'","'+'","'-'","'*'","'/'","'^'","if","while","else","doNull","'='","'('","')'","'{'","'}'","';'","var","%eof"]
        bit_start = st Prelude.* 32
        bit_end = (st Prelude.+ 1) Prelude.* 32
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..31]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (21) = happyShift action_3
action_0 (22) = happyShift action_4
action_0 (24) = happyShift action_5
action_0 (26) = happyShift action_6
action_0 (31) = happyShift action_7
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_3
action_1 (22) = happyShift action_4
action_1 (24) = happyShift action_5
action_1 (26) = happyShift action_6
action_1 (31) = happyShift action_7
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (30) = happyShift action_15
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (26) = happyShift action_14
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (26) = happyShift action_13
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_7

action_6 (21) = happyShift action_3
action_6 (22) = happyShift action_4
action_6 (24) = happyShift action_5
action_6 (26) = happyShift action_6
action_6 (31) = happyShift action_7
action_6 (4) = happyGoto action_12
action_6 (5) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (25) = happyShift action_11
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (32) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (30) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (21) = happyShift action_3
action_10 (22) = happyShift action_4
action_10 (24) = happyShift action_5
action_10 (26) = happyShift action_6
action_10 (31) = happyShift action_7
action_10 (4) = happyGoto action_16
action_10 (5) = happyGoto action_9
action_10 _ = happyReduce_2

action_11 (8) = happyShift action_19
action_11 (17) = happyShift action_23
action_11 (26) = happyShift action_29
action_11 (31) = happyShift action_25
action_11 (6) = happyGoto action_28
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (27) = happyShift action_27
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (8) = happyShift action_19
action_13 (9) = happyShift action_20
action_13 (10) = happyShift action_21
action_13 (13) = happyShift action_22
action_13 (17) = happyShift action_23
action_13 (26) = happyShift action_24
action_13 (31) = happyShift action_25
action_13 (6) = happyGoto action_17
action_13 (7) = happyGoto action_26
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (8) = happyShift action_19
action_14 (9) = happyShift action_20
action_14 (10) = happyShift action_21
action_14 (13) = happyShift action_22
action_14 (17) = happyShift action_23
action_14 (26) = happyShift action_24
action_14 (31) = happyShift action_25
action_14 (6) = happyGoto action_17
action_14 (7) = happyGoto action_18
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_3
action_15 (22) = happyShift action_4
action_15 (24) = happyShift action_5
action_15 (26) = happyShift action_6
action_15 (31) = happyShift action_7
action_15 (4) = happyGoto action_16
action_15 (5) = happyGoto action_9
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_1

action_17 (13) = happyShift action_44
action_17 (14) = happyShift action_45
action_17 (15) = happyShift action_46
action_17 (16) = happyShift action_31
action_17 (17) = happyShift action_32
action_17 (18) = happyShift action_33
action_17 (19) = happyShift action_34
action_17 (20) = happyShift action_35
action_17 (25) = happyShift action_47
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (11) = happyShift action_36
action_18 (12) = happyShift action_37
action_18 (27) = happyShift action_43
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_8

action_20 _ = happyReduce_17

action_21 _ = happyReduce_18

action_22 (8) = happyShift action_19
action_22 (9) = happyShift action_20
action_22 (10) = happyShift action_21
action_22 (13) = happyShift action_22
action_22 (17) = happyShift action_23
action_22 (26) = happyShift action_24
action_22 (31) = happyShift action_25
action_22 (6) = happyGoto action_17
action_22 (7) = happyGoto action_42
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_19
action_23 (17) = happyShift action_23
action_23 (26) = happyShift action_29
action_23 (31) = happyShift action_25
action_23 (6) = happyGoto action_41
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (8) = happyShift action_19
action_24 (9) = happyShift action_20
action_24 (10) = happyShift action_21
action_24 (13) = happyShift action_22
action_24 (17) = happyShift action_23
action_24 (26) = happyShift action_24
action_24 (31) = happyShift action_25
action_24 (6) = happyGoto action_39
action_24 (7) = happyGoto action_40
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_9

action_26 (11) = happyShift action_36
action_26 (12) = happyShift action_37
action_26 (27) = happyShift action_38
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_6

action_28 (16) = happyShift action_31
action_28 (17) = happyShift action_32
action_28 (18) = happyShift action_33
action_28 (19) = happyShift action_34
action_28 (20) = happyShift action_35
action_28 _ = happyReduce_5

action_29 (8) = happyShift action_19
action_29 (17) = happyShift action_23
action_29 (26) = happyShift action_29
action_29 (31) = happyShift action_25
action_29 (6) = happyGoto action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_31
action_30 (17) = happyShift action_32
action_30 (18) = happyShift action_33
action_30 (19) = happyShift action_34
action_30 (20) = happyShift action_35
action_30 (27) = happyShift action_56
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (8) = happyShift action_19
action_31 (17) = happyShift action_23
action_31 (26) = happyShift action_29
action_31 (31) = happyShift action_25
action_31 (6) = happyGoto action_64
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (8) = happyShift action_19
action_32 (17) = happyShift action_23
action_32 (26) = happyShift action_29
action_32 (31) = happyShift action_25
action_32 (6) = happyGoto action_63
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_19
action_33 (17) = happyShift action_23
action_33 (26) = happyShift action_29
action_33 (31) = happyShift action_25
action_33 (6) = happyGoto action_62
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (8) = happyShift action_19
action_34 (17) = happyShift action_23
action_34 (26) = happyShift action_29
action_34 (31) = happyShift action_25
action_34 (6) = happyGoto action_61
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (8) = happyShift action_19
action_35 (17) = happyShift action_23
action_35 (26) = happyShift action_29
action_35 (31) = happyShift action_25
action_35 (6) = happyGoto action_60
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (8) = happyShift action_19
action_36 (9) = happyShift action_20
action_36 (10) = happyShift action_21
action_36 (13) = happyShift action_22
action_36 (17) = happyShift action_23
action_36 (26) = happyShift action_24
action_36 (31) = happyShift action_25
action_36 (6) = happyGoto action_17
action_36 (7) = happyGoto action_59
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (8) = happyShift action_19
action_37 (9) = happyShift action_20
action_37 (10) = happyShift action_21
action_37 (13) = happyShift action_22
action_37 (17) = happyShift action_23
action_37 (26) = happyShift action_24
action_37 (31) = happyShift action_25
action_37 (6) = happyGoto action_17
action_37 (7) = happyGoto action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (28) = happyShift action_57
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (13) = happyShift action_44
action_39 (14) = happyShift action_45
action_39 (15) = happyShift action_46
action_39 (16) = happyShift action_31
action_39 (17) = happyShift action_32
action_39 (18) = happyShift action_33
action_39 (19) = happyShift action_34
action_39 (20) = happyShift action_35
action_39 (25) = happyShift action_47
action_39 (27) = happyShift action_56
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (11) = happyShift action_36
action_40 (12) = happyShift action_37
action_40 (27) = happyShift action_55
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_10

action_42 _ = happyReduce_21

action_43 (28) = happyShift action_54
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (25) = happyShift action_53
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (8) = happyShift action_19
action_45 (17) = happyShift action_23
action_45 (25) = happyShift action_52
action_45 (26) = happyShift action_29
action_45 (31) = happyShift action_25
action_45 (6) = happyGoto action_51
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (8) = happyShift action_19
action_46 (17) = happyShift action_23
action_46 (25) = happyShift action_50
action_46 (26) = happyShift action_29
action_46 (31) = happyShift action_25
action_46 (6) = happyGoto action_49
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (25) = happyShift action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (8) = happyShift action_19
action_48 (17) = happyShift action_23
action_48 (26) = happyShift action_29
action_48 (31) = happyShift action_25
action_48 (6) = happyGoto action_70
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (16) = happyShift action_31
action_49 (17) = happyShift action_32
action_49 (18) = happyShift action_33
action_49 (19) = happyShift action_34
action_49 (20) = happyShift action_35
action_49 _ = happyReduce_24

action_50 (8) = happyShift action_19
action_50 (17) = happyShift action_23
action_50 (26) = happyShift action_29
action_50 (31) = happyShift action_25
action_50 (6) = happyGoto action_69
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_31
action_51 (17) = happyShift action_32
action_51 (18) = happyShift action_33
action_51 (19) = happyShift action_34
action_51 (20) = happyShift action_35
action_51 _ = happyReduce_22

action_52 (8) = happyShift action_19
action_52 (17) = happyShift action_23
action_52 (26) = happyShift action_29
action_52 (31) = happyShift action_25
action_52 (6) = happyGoto action_68
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (8) = happyShift action_19
action_53 (17) = happyShift action_23
action_53 (26) = happyShift action_29
action_53 (31) = happyShift action_25
action_53 (6) = happyGoto action_67
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (21) = happyShift action_3
action_54 (22) = happyShift action_4
action_54 (24) = happyShift action_5
action_54 (26) = happyShift action_6
action_54 (31) = happyShift action_7
action_54 (4) = happyGoto action_66
action_54 (5) = happyGoto action_9
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_28

action_56 _ = happyReduce_16

action_57 (21) = happyShift action_3
action_57 (22) = happyShift action_4
action_57 (24) = happyShift action_5
action_57 (26) = happyShift action_6
action_57 (31) = happyShift action_7
action_57 (4) = happyGoto action_65
action_57 (5) = happyGoto action_9
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_20

action_59 _ = happyReduce_19

action_60 _ = happyReduce_15

action_61 (20) = happyShift action_35
action_61 _ = happyReduce_14

action_62 (20) = happyShift action_35
action_62 _ = happyReduce_13

action_63 (18) = happyShift action_33
action_63 (19) = happyShift action_34
action_63 (20) = happyShift action_35
action_63 _ = happyReduce_12

action_64 (18) = happyShift action_33
action_64 (19) = happyShift action_34
action_64 (20) = happyShift action_35
action_64 _ = happyReduce_11

action_65 (29) = happyShift action_72
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (29) = happyShift action_71
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (16) = happyShift action_31
action_67 (17) = happyShift action_32
action_67 (18) = happyShift action_33
action_67 (19) = happyShift action_34
action_67 (20) = happyShift action_35
action_67 _ = happyReduce_27

action_68 (16) = happyShift action_31
action_68 (17) = happyShift action_32
action_68 (18) = happyShift action_33
action_68 (19) = happyShift action_34
action_68 (20) = happyShift action_35
action_68 _ = happyReduce_23

action_69 (16) = happyShift action_31
action_69 (17) = happyShift action_32
action_69 (18) = happyShift action_33
action_69 (19) = happyShift action_34
action_69 (20) = happyShift action_35
action_69 _ = happyReduce_25

action_70 (16) = happyShift action_31
action_70 (17) = happyShift action_32
action_70 (18) = happyShift action_33
action_70 (19) = happyShift action_34
action_70 (20) = happyShift action_35
action_70 _ = happyReduce_26

action_71 (23) = happyShift action_73
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_4

action_73 (28) = happyShift action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (21) = happyShift action_3
action_74 (22) = happyShift action_4
action_74 (24) = happyShift action_5
action_74 (26) = happyShift action_6
action_74 (31) = happyShift action_7
action_74 (4) = happyGoto action_75
action_74 (5) = happyGoto action_9
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (29) = happyShift action_76
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_3

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

happyReduce_3 = happyReduce 11 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
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

happyReduce_4 = happyReduce 7 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
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

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (ExpSetVarInt happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn5
		 (ExpDoNull
	)

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (IntVal happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (IntVar happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (IntNegate happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntPlus happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntMinus happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntTimes happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntDivide happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntExponential happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn7
		 (BoolTrue
	)

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn7
		 (BoolFalse
	)

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolAnd happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolOr happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  7 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (BoolNot happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolLessThan happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 7 happyReduction_23
happyReduction_23 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolLessEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolMoreThan happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 7 happyReduction_25
happyReduction_25 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolMoreEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 7 happyReduction_26
happyReduction_26 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 7 happyReduction_27
happyReduction_27 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolNotEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 32 32 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 8;
	TokenTrue _ -> cont 9;
	TokenFalse _ -> cont 10;
	TokenAnd _ -> cont 11;
	TokenOr _ -> cont 12;
	TokenNot _ -> cont 13;
	TokenLessThan _ -> cont 14;
	TokenMoreThan _ -> cont 15;
	TokenPlus _ -> cont 16;
	TokenMinus _ -> cont 17;
	TokenTimes _ -> cont 18;
	TokenDiv _ -> cont 19;
	TokenExponential _ -> cont 20;
	TokenIf _ -> cont 21;
	TokenWhile _ -> cont 22;
	TokenElse _ -> cont 23;
	TokenDoNull _ -> cont 24;
	TokenEq _ -> cont 25;
	TokenLParen _ -> cont 26;
	TokenRParen _ -> cont 27;
	TokenLSquig _ -> cont 28;
	TokenRSquig _ -> cont 29;
	TokenSemiColon _ -> cont 30;
	TokenVar _ happy_dollar_dollar -> cont 31;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 32 tk tks = happyError' (tks, explist)
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

data Exp = ExpVar String
         | ExpIf ExpBool Exp Exp
         | ExpWhile ExpBool Exp
         | ExpSetVarInt String ExpInt
         | MultiExpr Exp Exp
         | ExpDoNull
    deriving (Show,Eq)

data ExpInt = IntVal Int
            | IntVar String
            | IntNegate ExpInt
            | IntPlus ExpInt ExpInt
            | IntMinus ExpInt ExpInt
            | IntTimes ExpInt ExpInt
            | IntDivide ExpInt ExpInt
            | IntExponential ExpInt ExpInt
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
