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
happyExpList = Happy_Data_Array.listArray (0,130) ([0,336,0,84,0,256,0,4,0,0,21504,0,0,0,16384,0,336,0,128,4408,16,16384,5,0,0,9212,49152,8192,0,0,0,0,0,0,4408,16,1026,32772,275,1,0,0,10495,12288,2048,0,0,16416,64,0,0,1102,32772,275,1,0,1,2048,512,1540,128,385,16416,64,4104,16,1026,32772,256,8193,16448,0,2048,512,1028,0,0,0,2,32768,0,14336,0,3584,0,992,2048,4112,0,62,128,257,16416,64,0,21,0,0,0,0,33760,0,0,0,0,0,2048,57344,3,63488,0,15872,0,3968,0,2048,0,16384,0,1344,0,2048,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","MultiExp","Exp","ExpInt","ExpBool","int","true","false","'&&'","'||'","'!'","'<'","'>'","'+'","'-'","'*'","'/'","'^'","if","else","doNull","'='","'('","')'","'{'","'}'","';'","%eof"]
        bit_start = st Prelude.* 30
        bit_end = (st Prelude.+ 1) Prelude.* 30
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..29]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (21) = happyShift action_3
action_0 (23) = happyShift action_4
action_0 (25) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_3
action_1 (23) = happyShift action_4
action_1 (25) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (29) = happyShift action_11
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (25) = happyShift action_10
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_5

action_5 (21) = happyShift action_3
action_5 (23) = happyShift action_4
action_5 (25) = happyShift action_5
action_5 (4) = happyGoto action_9
action_5 (5) = happyGoto action_7
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (30) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (29) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (21) = happyShift action_3
action_8 (23) = happyShift action_4
action_8 (25) = happyShift action_5
action_8 (4) = happyGoto action_12
action_8 (5) = happyGoto action_7
action_8 _ = happyReduce_2

action_9 (26) = happyShift action_21
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (8) = happyShift action_15
action_10 (9) = happyShift action_16
action_10 (10) = happyShift action_17
action_10 (13) = happyShift action_18
action_10 (17) = happyShift action_19
action_10 (25) = happyShift action_20
action_10 (6) = happyGoto action_13
action_10 (7) = happyGoto action_14
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (21) = happyShift action_3
action_11 (23) = happyShift action_4
action_11 (25) = happyShift action_5
action_11 (4) = happyGoto action_12
action_11 (5) = happyGoto action_7
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_1

action_13 (13) = happyShift action_30
action_13 (14) = happyShift action_31
action_13 (15) = happyShift action_32
action_13 (16) = happyShift action_33
action_13 (17) = happyShift action_34
action_13 (18) = happyShift action_35
action_13 (19) = happyShift action_36
action_13 (20) = happyShift action_37
action_13 (24) = happyShift action_38
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (11) = happyShift action_27
action_14 (12) = happyShift action_28
action_14 (26) = happyShift action_29
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_6

action_16 _ = happyReduce_14

action_17 _ = happyReduce_15

action_18 (8) = happyShift action_15
action_18 (9) = happyShift action_16
action_18 (10) = happyShift action_17
action_18 (13) = happyShift action_18
action_18 (17) = happyShift action_19
action_18 (25) = happyShift action_20
action_18 (6) = happyGoto action_13
action_18 (7) = happyGoto action_26
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (8) = happyShift action_15
action_19 (17) = happyShift action_19
action_19 (25) = happyShift action_25
action_19 (6) = happyGoto action_24
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (8) = happyShift action_15
action_20 (9) = happyShift action_16
action_20 (10) = happyShift action_17
action_20 (13) = happyShift action_18
action_20 (17) = happyShift action_19
action_20 (25) = happyShift action_20
action_20 (6) = happyGoto action_22
action_20 (7) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_4

action_22 (13) = happyShift action_30
action_22 (14) = happyShift action_31
action_22 (15) = happyShift action_32
action_22 (16) = happyShift action_33
action_22 (17) = happyShift action_34
action_22 (18) = happyShift action_35
action_22 (19) = happyShift action_36
action_22 (20) = happyShift action_37
action_22 (24) = happyShift action_38
action_22 (26) = happyShift action_55
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (11) = happyShift action_27
action_23 (12) = happyShift action_28
action_23 (26) = happyShift action_54
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_7

action_25 (8) = happyShift action_15
action_25 (17) = happyShift action_19
action_25 (25) = happyShift action_25
action_25 (6) = happyGoto action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_18

action_27 (8) = happyShift action_15
action_27 (9) = happyShift action_16
action_27 (10) = happyShift action_17
action_27 (13) = happyShift action_18
action_27 (17) = happyShift action_19
action_27 (25) = happyShift action_20
action_27 (6) = happyGoto action_13
action_27 (7) = happyGoto action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (8) = happyShift action_15
action_28 (9) = happyShift action_16
action_28 (10) = happyShift action_17
action_28 (13) = happyShift action_18
action_28 (17) = happyShift action_19
action_28 (25) = happyShift action_20
action_28 (6) = happyGoto action_13
action_28 (7) = happyGoto action_51
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (27) = happyShift action_50
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (8) = happyShift action_15
action_31 (17) = happyShift action_19
action_31 (24) = happyShift action_48
action_31 (25) = happyShift action_25
action_31 (6) = happyGoto action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (8) = happyShift action_15
action_32 (17) = happyShift action_19
action_32 (24) = happyShift action_46
action_32 (25) = happyShift action_25
action_32 (6) = happyGoto action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_15
action_33 (17) = happyShift action_19
action_33 (25) = happyShift action_25
action_33 (6) = happyGoto action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (8) = happyShift action_15
action_34 (17) = happyShift action_19
action_34 (25) = happyShift action_25
action_34 (6) = happyGoto action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (8) = happyShift action_15
action_35 (17) = happyShift action_19
action_35 (25) = happyShift action_25
action_35 (6) = happyGoto action_42
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (8) = happyShift action_15
action_36 (17) = happyShift action_19
action_36 (25) = happyShift action_25
action_36 (6) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (8) = happyShift action_15
action_37 (17) = happyShift action_19
action_37 (25) = happyShift action_25
action_37 (6) = happyGoto action_40
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (24) = happyShift action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (8) = happyShift action_15
action_39 (17) = happyShift action_19
action_39 (25) = happyShift action_25
action_39 (6) = happyGoto action_60
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_12

action_41 (20) = happyShift action_37
action_41 _ = happyReduce_11

action_42 (20) = happyShift action_37
action_42 _ = happyReduce_10

action_43 (18) = happyShift action_35
action_43 (19) = happyShift action_36
action_43 (20) = happyShift action_37
action_43 _ = happyReduce_9

action_44 (18) = happyShift action_35
action_44 (19) = happyShift action_36
action_44 (20) = happyShift action_37
action_44 _ = happyReduce_8

action_45 (16) = happyShift action_33
action_45 (17) = happyShift action_34
action_45 (18) = happyShift action_35
action_45 (19) = happyShift action_36
action_45 (20) = happyShift action_37
action_45 _ = happyReduce_21

action_46 (8) = happyShift action_15
action_46 (17) = happyShift action_19
action_46 (25) = happyShift action_25
action_46 (6) = happyGoto action_59
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (16) = happyShift action_33
action_47 (17) = happyShift action_34
action_47 (18) = happyShift action_35
action_47 (19) = happyShift action_36
action_47 (20) = happyShift action_37
action_47 _ = happyReduce_19

action_48 (8) = happyShift action_15
action_48 (17) = happyShift action_19
action_48 (25) = happyShift action_25
action_48 (6) = happyGoto action_58
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (8) = happyShift action_15
action_49 (17) = happyShift action_19
action_49 (25) = happyShift action_25
action_49 (6) = happyGoto action_57
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (21) = happyShift action_3
action_50 (23) = happyShift action_4
action_50 (25) = happyShift action_5
action_50 (4) = happyGoto action_56
action_50 (5) = happyGoto action_7
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_17

action_52 _ = happyReduce_16

action_53 (16) = happyShift action_33
action_53 (17) = happyShift action_34
action_53 (18) = happyShift action_35
action_53 (19) = happyShift action_36
action_53 (20) = happyShift action_37
action_53 (26) = happyShift action_55
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_25

action_55 _ = happyReduce_13

action_56 (28) = happyShift action_61
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (16) = happyShift action_33
action_57 (17) = happyShift action_34
action_57 (18) = happyShift action_35
action_57 (19) = happyShift action_36
action_57 (20) = happyShift action_37
action_57 _ = happyReduce_24

action_58 (16) = happyShift action_33
action_58 (17) = happyShift action_34
action_58 (18) = happyShift action_35
action_58 (19) = happyShift action_36
action_58 (20) = happyShift action_37
action_58 _ = happyReduce_20

action_59 (16) = happyShift action_33
action_59 (17) = happyShift action_34
action_59 (18) = happyShift action_35
action_59 (19) = happyShift action_36
action_59 (20) = happyShift action_37
action_59 _ = happyReduce_22

action_60 (16) = happyShift action_33
action_60 (17) = happyShift action_34
action_60 (18) = happyShift action_35
action_60 (19) = happyShift action_36
action_60 (20) = happyShift action_37
action_60 _ = happyReduce_23

action_61 (22) = happyShift action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (27) = happyShift action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (21) = happyShift action_3
action_63 (23) = happyShift action_4
action_63 (25) = happyShift action_5
action_63 (4) = happyGoto action_64
action_63 (5) = happyGoto action_7
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_3

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

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn5
		 (ExpDoNull
	)

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (IntVal happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (IntNegate happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntPlus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntMinus happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntTimes happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntDivide happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (IntExponential happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (BoolTrue
	)

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn7
		 (BoolFalse
	)

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolAnd happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolOr happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  7 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (BoolNot happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolLessThan happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 7 happyReduction_20
happyReduction_20 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolLessEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (BoolMoreThan happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 7 happyReduction_22
happyReduction_22 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolMoreEqualThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 4 7 happyReduction_23
happyReduction_23 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 7 happyReduction_24
happyReduction_24 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BoolNotEqual happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 30 30 notHappyAtAll (HappyState action) sts stk []

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
	TokenElse _ -> cont 22;
	TokenDoNull _ -> cont 23;
	TokenEq _ -> cont 24;
	TokenLParen _ -> cont 25;
	TokenRParen _ -> cont 26;
	TokenLSquig _ -> cont 27;
	TokenRSquig _ -> cont 28;
	TokenSemiColon _ -> cont 29;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 30 tk tks = happyError' (tks, explist)
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

data Exp = ExpDoNull
         | ExpIf ExpBool Exp Exp
--         | ExpWhile ExpBool Exp
         | ExpSetVarInt String ExpInt
         | MultiExpr Exp Exp
--         | ExpVar String
    deriving (Show,Eq)

data ExpInt = IntVal Int
--            | IntVar String
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
