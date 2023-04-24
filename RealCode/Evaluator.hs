module Evaluator where
import Grammar

--String: Variable Name
--Expr: Variable Value
type Variables = [(String, Int)]
type Environment = (Exp, Variables)


evaluateExp :: Exp -> Environment -> Exp
--Basic rules for reducing the language down from multi expressions into one
evaluateExp (ExpDoNull) _ = ExpDoNull
evaluateExp (MultiExpr ExpDoNull ExpDoNull) _ = ExpDoNull
evaluateExp (MultiExpr ExpDoNull exp2) env = evaluateExp (MultiExpr ExpDoNull (evaluateExp exp2 env)) env
evaluateExp (MultiExpr exp1 exp2) env = evaluateExp (MultiExpr (evaluateExp exp1 env) exp2) env


evaluateExp (ExpIf bool1 exp1 exp2) env | newBool1 = evaluateExp exp1 env
                                        | otherwise = evaluateExp exp2 env
                                            where newBool1 = evaluateExpBool bool1 env



--Not correct need to properly implement while loop
--evaluateExp (ExpWhile boolexp exp1) env = evaluateExp (evaluateExp exp1 env) env

--evaluateExp (ExpSetVarInt name value) env = ???








evaluateExpInt :: ExpInt -> Environment -> Int
evaluateExpInt (IntVal int1) env = int1
evaluateExpInt (IntNegate int1) env = - (evaluateExpInt int1 env)
--evaluateExpInt (IntVar varName) env = ?????

evaluateExpInt (IntPlus int1 int2) env = (newInt1) + (newInt2)
                                            where newInt1 = evaluateExpInt int1 env
                                                  newInt2 = evaluateExpInt int2 env

evaluateExpInt (IntMinus int1 int2) env = (newInt1) - (newInt2)
                                            where newInt1 = evaluateExpInt int1 env
                                                  newInt2 = evaluateExpInt int2 env

evaluateExpInt (IntTimes int1 int2) env = (newInt1) * (newInt2)
                                            where newInt1 = evaluateExpInt int1 env
                                                  newInt2 = evaluateExpInt int2 env
                                                
evaluateExpInt (IntDivide int1 int2) env = (newInt1) `div` (newInt2)
                                            where newInt1 = evaluateExpInt int1 env
                                                  newInt2 = evaluateExpInt int2 env

evaluateExpInt (IntExponential int1 int2) env = (newInt1) ^ (newInt2)
                                            where newInt1 = evaluateExpInt int1 env
                                                  newInt2 = evaluateExpInt int2 env






evaluateExpBool :: ExpBool -> Environment -> Bool
evaluateExpBool BoolTrue _ = True
evaluateExpBool BoolFalse _ = False

evaluateExpBool (BoolAnd bool1 bool2) env = (newBool1) && (newBool2)
                                            where newBool1 = evaluateExpBool bool1 env
                                                  newBool2 = evaluateExpBool bool2 env
                                                
evaluateExpBool (BoolOr bool1 bool2) env = (newBool1) && (newBool2)
                                            where newBool1 = evaluateExpBool bool1 env
                                                  newBool2 = evaluateExpBool bool2 env

evaluateExpBool (BoolNot bool1) env = not (newBool1)
                                            where newBool1 = evaluateExpBool bool1 env

evaluateExpBool (BoolLessThan exp1 exp2) env = (newInt1) < (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env

evaluateExpBool (BoolLessEqualThan exp1 exp2) env = (newInt1) <= (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env

evaluateExpBool (BoolMoreThan exp1 exp2) env = (newInt1) > (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env

evaluateExpBool (BoolMoreEqualThan exp1 exp2) env = (newInt1) >= (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env

evaluateExpBool (BoolEqual exp1 exp2) env = (newInt1) == (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env

evaluateExpBool (BoolNotEqual exp1 exp2) env = (newInt1) /= (newInt2)
                                            where newInt1 = evaluateExpInt exp1 env
                                                  newInt2 = evaluateExpInt exp2 env


convBoolToExpBool :: Bool -> ExpBool
convBoolToExpBool True = BoolTrue
convBoolToExpBool False = BoolFalse

convIntToExpInt :: Int -> ExpInt
convIntToExpInt val = IntVal val