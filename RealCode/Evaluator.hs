module Evaluator where
import Grammar
import Data.List
import System.IO
import Control.Monad

type Environment = ([(String, IO TileVar)],[(String, Int)])
type State = ([Exp], Environment)


data TileVar = Tile [String]
      deriving (Show,Eq)

evaluateExp :: State -> IO ()
evaluateExp state@(([]),env) = return ()
evaluateExp state@((ExpDoNothing:xs) ,env) = evaluateExp (xs,env)
evaluateExp state@(((MultiExpr exp1 exp2):xs),env) = evaluateExp ((exp1:exp2:xs),env)

evaluateExp(((ExpIf bool1 exp1 exp2):xs),env) | newBool1 = evaluateExp ((exp1:xs),env)
                                              | otherwise = evaluateExp ((exp2:xs),env)
                                              where newBool1 = evaluateExpBool (bool1,env)
                                              --Evaluates bool to true or false for the if statement and evaluates one of the expressions

evaluateExp((exp@(ExpWhile bool1 exp1):xs),env) | newBool1 = evaluateExp ((exp1:exp:xs),env)
                                                  | otherwise = evaluateExp ((xs),env)
                                                  where newBool1 = evaluateExpBool (bool1,env)
                                                  --Evaluates bool to true or false for the while statement and appends

evaluateExp(((ExpPrint tile1):xs),env) = do newTile1 <- evaluateExpTile (tile1,env)
                                            prettyPrint (newTile1) 
                                            evaluateExp (xs, env)

evaluateExp(((ExpSetTileVar name tile1):xs),env) = evaluateExp (xs, addTileVar name newTile1 env)
                                       where newTile1 = (evaluateExpTile (tile1,env))

evaluateExp(((ExpSetIntVar name int1):xs),env) = evaluateExp(xs, addIntVar name newInt1 env)
                                       where newInt1 = (evaluateExpInt (int1,env))

evaluateExp(((ExpGetTileFile file name):xs),env) = evaluateExp (xs, getTileFile file name env)


getTileFile :: String -> String -> Environment -> Environment
getTileFile filename varname (tiles,ints) = (((varname, (createTileFromFile filename)):tiles),ints)


createTileFromFile :: String -> IO TileVar
createTileFromFile filename = do    
    let list = []
    handle <- openFile (filename++".tl") ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = singlewords
    return (Tile list)


evaluateExpTile :: (ExpTile,Environment) -> IO TileVar
evaluateExpTile ((TileVar name),env) = getTileVar name env

evaluateExpTile ((TileCTR tile1 tile2),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 newTile2 <- evaluateExpTile (tile2,env)
                                                 return $ combineTilesRight (newTile1) (newTile2)

evaluateExpTile ((TileCTD tile1 tile2),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 newTile2 <- evaluateExpTile (tile2,env)
                                                 return $ combineTilesDown (newTile1) (newTile2)
      

evaluateExpTile ((TileDTR tile1 int1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 let newInt1 = evaluateExpInt (int1,env)
                                                 return $ duplicateTileRight(newTile1) (newInt1)

evaluateExpTile ((TileDTD tile1 int1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 let newInt1 = evaluateExpInt (int1,env)
                                                 return $ duplicateTileDown (newTile1) (newInt1)

evaluateExpTile ((TileRT90 tile1),env) =  do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ rotateTile90Degrees (newTile1)

evaluateExpTile ((TileRT180 tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ rotateTile180Degrees (newTile1)

evaluateExpTile ((TileRT270 tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ rotateTile270Degrees (newTile1)

evaluateExpTile ((TileSRT tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ squareRotateTile (newTile1)

evaluateExpTile ((TileST tile1 int1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 let newInt1 = evaluateExpInt (int1,env)
                                                 return $ scaleTile (newTile1) (newInt1)

evaluateExpTile ((TileCBT tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ createBlankTile (newTile1)

evaluateExpTile ((TileRTX tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ reflectTileX (newTile1)

evaluateExpTile ((TileRTY tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ reflectTileY (newTile1)

evaluateExpTile ((TileRTXY tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ reflectTileXY (newTile1)

evaluateExpTile ((TileSub tile1 int1 int2 int3 int4),env) = do
                                                newTile1 <- evaluateExpTile (tile1,env)
                                                let newInt1 = evaluateExpInt (int1,env)
                                                let newInt2 = evaluateExpInt (int2,env)
                                                let newInt3 = evaluateExpInt (int3,env)
                                                let newInt4 = evaluateExpInt (int4,env)
                                                return $ createSubTile (newTile1) (newInt1) (newInt2) (newInt3) (newInt4)

evaluateExpTile ((TileConjunct tile1 tile2),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 newTile2 <- evaluateExpTile (tile2,env)
                                                 return $ conjunctTiles (newTile1) (newTile2)
      

evaluateExpTile ((TileNegate tile1),env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 return $ negateTile (newTile1)

evaluateExpTile ((TileRemoveTop tile1 int1), env) = do
                                                 newTile1 <- evaluateExpTile (tile1,env)
                                                 let newInt1 = evaluateExpInt (int1,env)
                                                 return $ removeTop (newTile1) (newInt1)

addTileVar :: String -> IO TileVar -> Environment -> Environment
addTileVar name tile (tiles,ints) | variableNameExists name tiles = ((replaceTileVar name tile tiles),ints)
                                  | otherwise = ((name,tile):tiles,ints)



--Functions for adding/getting tile variables
getTileVar :: String -> Environment -> IO TileVar
getTileVar name (tiles,ints) | variableNameExists name tiles = getTileVariable name tiles
                             | otherwise = error ("Error: Variable name " ++ name ++ " does not exist " ++ show(length tiles))


getTileVariable :: String -> [(String, IO TileVar)] -> IO TileVar
getTileVariable name ((var,tile):xs) | name == var = tile
                                     | otherwise = getTileVariable name xs

variableNameExists :: String -> [(String, a)] -> Bool
variableNameExists name [] = False
variableNameExists name ((var,tile):xs) | name == var = True
                                        | otherwise = variableNameExists name xs

replaceTileVar :: String -> IO TileVar -> [(String, IO TileVar)] -> [(String, IO TileVar)]
replaceTileVar name tile ((var,tilevar):xs) | name == var = (name,tile):xs
                                            | otherwise = (var,tilevar) : replaceTileVar name tile xs


--Functions for adding/getting int variables
addIntVar :: String -> Int -> Environment -> Environment
addIntVar name int (tiles,ints) | variableNameExists name ints = (tiles,(replaceIntVar name int ints))
                                | otherwise = (tiles,(name,int):ints)

getIntVar :: String -> Environment -> Int
getIntVar name (tiles,ints) | variableNameExists name ints = getIntVariable name ints
                            | otherwise = error ("Error: Variable name" ++ name ++ "does not exist")

getIntVariable :: String -> [(String, Int)] -> Int
getIntVariable name ((var,int):xs) | name == var = int
                                   | otherwise = getIntVariable name xs

replaceIntVar :: String -> Int -> [(String, Int)] -> [(String, Int)]
replaceIntVar name int ((var,intvar):xs) | name == var = (name,int):xs
                                         | otherwise = (var,intvar) : replaceIntVar name int xs

evaluateExpInt :: (ExpInt,Environment) -> Int
evaluateExpInt ((IntVal int1),env) = int1
evaluateExpInt ((IntVar name),env) = getIntVar name env
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
createBlankTile :: TileVar -> TileVar
createBlankTile (Tile [x]) = Tile [(concat $ replicate (length x) "0")]
createBlankTile (Tile (x:xs)) = Tile (replicate (length (x:xs)) $ (concat $ replicate (length x) "0"))



--Used to reflect a tile by x axis
reflectTileX :: TileVar -> TileVar
reflectTileX (Tile x) = Tile (reverse x)

--Used to reflect a tile by y axis
reflectTileY :: TileVar -> TileVar
reflectTileY (Tile x) = Tile (map reverse x)

--Used to reflect a tile by y=x
reflectTileXY :: TileVar -> TileVar
reflectTileXY (tile) = reflectTileY $ reflectTileX tile

--Used to conjunct two tiles
conjunctTiles :: TileVar -> TileVar -> TileVar
conjunctTiles (Tile x) (Tile y) = Tile (map zipTiles (zip x y))
	where zipTiles (x,y) = zipWith (\x y -> if all (=='1') [x,y] then '1' else '0') x y

--Used to negate a tile
negateTile :: TileVar -> TileVar
negateTile (Tile x) = Tile (map negateRow x)
	where negateRow = map (\x -> if x == '0' then '1' else '0')


--Used to create sub tiles from starting positions and lengths
createSubTile :: TileVar -> Int -> Int -> Int -> Int -> TileVar
createSubTile (Tile xs) (xPos) (yPos) xsize ysize = Tile (splitList yPos ysize $ map (splitList xPos xsize) xs)

splitList :: Int -> Int -> [a] -> [a]
splitList startPos length xs = take (length) (drop (startPos) xs)


removeTop :: TileVar -> Int -> TileVar
removeTop (Tile xs) val = Tile (drop val xs)

--Used to Pretty Print a tile
prettyPrint :: TileVar -> IO ()	
prettyPrint (Tile xs) = putStrLn $ id $ intercalate "\n" xs