module Evaluator where
import Grammar
import Data.List

type Environment = [(String, TileVar)]
type State = ([Exp], Environment)


data TileVar = Tile [String]

evaluateExp :: State -> IO ()
evaluateExp state@(([]),env) = return ()
evaluateExp state@((ExpDoNothing:xs) ,env) = evaluateExp (xs,env)
evaluateExp state@(((MultiExpr exp1 exp2):xs),env) = evaluateExp ((exp1:exp2:xs),env)

evaluateExp(((ExpIf bool1 exp1 exp2):xs),env) | newBool1 = evaluateExp ((exp1:xs),env)
                                              | otherwise = evaluateExp ((exp1:xs),env)
                                              where newBool1 = evaluateExpBool (bool1,env)
                                              --Evaluates bool to true or false for the if statement and evaluates one of the expressions

evaluateExp((exp@(ExpWhile bool1 exp1):xs),env) | newBool1 = evaluateExp ((exp1:exp:xs),env)
                                                  | otherwise = evaluateExp ((xs),env)
                                                  where newBool1 = evaluateExpBool (bool1,env)
                                                  --Evaluates bool to true or false for the while statement and appends

evaluateExp(((ExpPrint tile1):xs),env) = do prettyPrint (evaluateExpTile (tile1,env)) 
                                            evaluateExp (xs, env)

evaluateExp(((ExpSetTileVar name tile1):xs),env) = evaluateExp (xs, addTileVar name newTile1 env)
                                       where newTile1 = (evaluateExpTile (tile1,env))



evaluateExpTile :: (ExpTile,Environment) -> TileVar
evaluateExpTile ((TileVar name),env) = getTileVar name env

evaluateExpTile ((TileCTR tile1 tile2),env) = combineTilesRight (newTile1) (newTile2)
                                             where newTile1 = evaluateExpTile (tile1,env)
                                                   newTile2 = evaluateExpTile (tile2,env)

evaluateExpTile ((TileCTD tile1 tile2),env) = combineTilesDown (newTile1) (newTile2)
                                             where newTile1 = evaluateExpTile (tile1,env)
                                                   newTile2 = evaluateExpTile (tile2,env)

evaluateExpTile ((TileDTR tile1 int1),env) = duplicateTileRight (newTile1) (newInt1)
                                             where newTile1 = evaluateExpTile (tile1,env)
                                                   newInt1 = evaluateExpInt (int1,env)

evaluateExpTile ((TileDTD tile1 int1),env) = duplicateTileDown (newTile1) (newInt1)
                                             where newTile1 = evaluateExpTile (tile1,env)
                                                   newInt1 = evaluateExpInt (int1,env)

evaluateExpTile ((TileRT90 tile1),env) = rotateTile90Degrees (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileRT180 tile1),env) = rotateTile180Degrees (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileRT270 tile1),env) = rotateTile270Degrees (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileSRT tile1),env) = squareRotateTile (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileST tile1 int1),env) = scaleTile (newTile1) (newInt1)
                                             where newTile1 = evaluateExpTile (tile1,env)
                                                   newInt1 = evaluateExpInt (int1,env)

evaluateExpTile ((TileCBT tile1),env) = createBlankTile (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileRTX tile1),env) = reflectTileX (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileRTY tile1),env) = reflectTileY (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)

evaluateExpTile ((TileRTXY tile1),env) = reflectTileXY (newTile1)
                                             where newTile1 = evaluateExpTile (tile1,env)


addTileVar :: String -> TileVar -> Environment -> Environment
addTileVar name tile env | variableNameExists name env = replaceTileVar name tile env
                         | otherwise = (name,tile):env


getTileVar :: String -> Environment -> TileVar
getTileVar name env | variableNameExists name env = getTileVariable name env
                    | otherwise = error "Error: Variable name does not exist"

getTileVariable :: String -> Environment -> TileVar
getTileVariable name ((var,tile):xs) | name == var = tile
                                     | otherwise = getTileVariable name xs

variableNameExists :: String -> Environment -> Bool
variableNameExists name [] = False
variableNameExists name ((var,tile):xs) | name == var = True
                                        | otherwise = variableNameExists name xs

replaceTileVar :: String -> TileVar -> Environment -> Environment
replaceTileVar name tile ((var,tilevar):xs) | name == var = (name,tile):xs
                                            | otherwise = (var,tilevar) : replaceTileVar name tile xs




evaluateExpInt :: (ExpInt,Environment) -> Int
evaluateExpInt ((IntVal int1),env) = int1
evaluateExpInt ((IntNegate int1),env) = - evaluateExpInt (int1,env)

evaluateExpInt ((IntPlus int1 int2),env) = (newInt1) + (newInt2)
                                            where newInt1 = evaluateExpInt (int1,env)
                                                  newInt2 = evaluateExpInt (int2,env)

evaluateExpInt ((IntMinus int1 int2),env) = (newInt1) - (newInt2)
                                            where newInt1 = evaluateExpInt (int1,env)
                                                  newInt2 = evaluateExpInt (int2,env)

evaluateExpInt ((IntTimes int1 int2),env) = (newInt1) * (newInt2)
                                            where newInt1 = evaluateExpInt (int1,env)
                                                  newInt2 = evaluateExpInt (int2,env)
                                                
evaluateExpInt ((IntDivide int1 int2),env) = (newInt1) `div` (newInt2)
                                            where newInt1 = evaluateExpInt (int1,env)
                                                  newInt2 = evaluateExpInt (int2,env)

evaluateExpInt ((IntExponential int1 int2),env) = (newInt1) ^ (newInt2)
                                            where newInt1 = evaluateExpInt (int1,env)
                                                  newInt2 = evaluateExpInt (int2,env)






evaluateExpBool :: (ExpBool,Environment) ->  Bool
evaluateExpBool (BoolTrue,env) = True
evaluateExpBool (BoolFalse,env) = False

evaluateExpBool ((BoolAnd bool1 bool2),env) = (newBool1) && (newBool2)
                                            where newBool1 = evaluateExpBool (bool1,env)
                                                  newBool2 = evaluateExpBool (bool2,env)
                                                
evaluateExpBool ((BoolOr bool1 bool2),env) = (newBool1) && (newBool2)
                                            where newBool1 = evaluateExpBool (bool1,env)
                                                  newBool2 = evaluateExpBool (bool2,env)

evaluateExpBool ((BoolNot bool1),env) = not (newBool1)
                                            where newBool1 = evaluateExpBool (bool1,env)

evaluateExpBool ((BoolLessThan exp1 exp2),env) = (newInt1) < (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)

evaluateExpBool ((BoolLessEqualThan exp1 exp2),env) = (newInt1) <= (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)

evaluateExpBool ((BoolMoreThan exp1 exp2),env) = (newInt1) > (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)

evaluateExpBool ((BoolMoreEqualThan exp1 exp2),env) = (newInt1) >= (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)

evaluateExpBool ((BoolEqual exp1 exp2),env) = (newInt1) == (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)

evaluateExpBool ((BoolNotEqual exp1 exp2),env) = (newInt1) /= (newInt2)
                                            where newInt1 = evaluateExpInt (exp1,env)
                                                  newInt2 = evaluateExpInt (exp2,env)


convBoolToExpBool :: Bool -> ExpBool
convBoolToExpBool True = BoolTrue
convBoolToExpBool False = BoolFalse

convIntToExpInt :: Int -> ExpInt
convIntToExpInt val = IntVal val


-----------------------------------------------
--ALL CODE BELOW IS USED TO TRANSFORM A TILEVAR
-----------------------------------------------


--Used to Combine two Tiles to the right
combineTilesRight :: TileVar -> TileVar -> TileVar
combineTilesRight (Tile xs) (Tile ys) = Tile (combineLineArrays xs ys)

combineLineArrays :: [String] -> [String] -> [String]
combineLineArrays [] [] = []
combineLineArrays _ [] = error "Not same tile size" 
combineLineArrays [] _ = error "Not same tile size"
combineLineArrays (x:xs) (y:ys) = [x++y] ++ combineLineArrays xs ys


--Used to duplicate a tile right for specified amount
duplicateTileRight :: TileVar -> Int -> TileVar
duplicateTileRight (tile) amount | amount == 1 = tile
				 | otherwise = (combineTilesRight (tile) (duplicateTileRight tile (amount-1)))



--Used to duplicate a tile down for a specified amount
duplicateTileDown :: TileVar -> Int -> TileVar
duplicateTileDown (tile) amount | amount == 1 = tile
				| otherwise = (combineTilesDown (tile) (duplicateTileDown tile (amount-1)))



--Used to combine two tiles above/below each other
combineTilesDown :: TileVar -> TileVar -> TileVar 
combineTilesDown (Tile xs) (Tile ys) = Tile (xs ++ ys)




--Used to rotate a tile
rotateTile90Degrees (Tile xs) = Tile (rotateHelper(xs))
rotateTile180Degrees (tile) = rotateTile90Degrees $ rotateTile90Degrees tile
rotateTile270Degrees (tile) = rotateTile90Degrees $ rotateTile90Degrees $ rotateTile90Degrees tile

rotateHelper :: [String] -> [String]
rotateHelper (xs) | length (xs!!0) > 1 = getFirst xs : rotateHelper (map tail xs)
		  | otherwise = [getFirst xs]

getFirst :: [String] -> String
getFirst [] = []
getFirst (x:xs) = getFirst xs ++ [head x]





--Combines all 4 rotated tiles into one big tile
squareRotateTile (x) = combineTilesDown (combineTilesRight x (rotateTile90Degrees x)) (combineTilesRight (rotateTile270Degrees x) (rotateTile180Degrees x)) 



--Used to Scale a Tile
scaleTile :: TileVar -> Int -> TileVar
scaleTile (Tile xs) amount = (scaleTileRow xs amount)

scaleTileRow :: [String] -> Int -> TileVar
scaleTileRow [x] amount = (scaleTileLine (x) amount)
scaleTileRow (x:xs) amount = combineTilesDown (scaleTileLine (x) amount) (scaleTileRow xs amount)

scaleTileLine :: String -> Int -> TileVar
scaleTileLine [x] amount = Tile (scaleTileSingular x amount)
scaleTileLine (x:xs) amount = combineTilesRight (Tile (scaleTileSingular x amount)) (scaleTileLine xs amount)

scaleTileSingular :: Char -> Int -> [String]
scaleTileSingular x amount = replicate amount $ (concat $ replicate amount [x])



--Used to create a blank tile replica of the same size of the input tile
createBlankTile (Tile [x]) = Tile [(concat $ replicate (length x) "0")]
createBlankTile (Tile (x:xs)) = Tile (replicate (length (x:xs)) $ (concat $ replicate (length x) "0"))



--Used to reflect a tile by x axis
reflectTileX (Tile x) = Tile (reverse x)

--Used to reflect a tile by y axis
reflectTileY (Tile x) = Tile (map reverse x)

--Used to reflect a tile by y=x
reflectTileXY (tile) = reflectTileY $ reflectTileX tile





--Used to Pretty Print a tile (OLD MAYBE USE THO??)
--prettyPrint :: TileVar -> IO ()
--prettyPrint (Tile [x]) = putStrLn $ id x
--prettyPrint (Tile (x:xs)) = do
--			putStrLn $ id x
--			prettyPrint (Tile xs)

--Used to Pretty Print a tile
prettyPrint :: TileVar -> IO ()	
prettyPrint (Tile xs) = putStrLn $ id $ intercalate "\n" xs