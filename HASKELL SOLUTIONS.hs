import Data.List

data TileExp = Tile [String]
    deriving (Show,Eq)


--Used to Combine two Tiles to the right
combineTilesRight :: TileExp -> TileExp -> TileExp
combineTilesRight (Tile xs) (Tile ys) = Tile (combineLineArrays xs ys)

combineLineArrays :: [String] -> [String] -> [String]
combineLineArrays [] [] = []
combineLineArrays _ [] = error "Not same tile size" 
combineLineArrays [] _ = error "Not same tile size"
combineLineArrays (x:xs) (y:ys) = [x++y] ++ combineLineArrays xs ys


--Used to duplicate a tile right for specified amount
duplicateTileRight :: TileExp -> Int -> TileExp
duplicateTileRight (tile) amount | amount == 1 = tile
				 | otherwise = (combineTilesRight (tile) (duplicateTileRight tile (amount-1)))



--Used to duplicate a tile down for a specified amount
duplicateTileDown :: TileExp -> Int -> TileExp
duplicateTileDown (tile) amount | amount == 1 = tile
				| otherwise = (combineTilesDown (tile) (duplicateTileDown tile (amount-1)))



--Used to combine two tiles above/below each other
combineTilesDown :: TileExp -> TileExp -> TileExp 
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
scaleTile :: TileExp -> Int -> TileExp
scaleTile (Tile xs) amount = (scaleTileRow xs amount)

scaleTileRow :: [String] -> Int -> TileExp
scaleTileRow [x] amount = (scaleTileLine (x) amount)
scaleTileRow (x:xs) amount = combineTilesDown (scaleTileLine (x) amount) (scaleTileRow xs amount)

scaleTileLine :: String -> Int -> TileExp
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


--Used to conjunct two tiles
conjunctTiles (Tile x) (Tile y) = Tile (map zipTiles (zip x y))
	where zipTiles (x,y) = zipWith (\x y -> if all (=='1') [x,y] then '1' else '0') x y

--Used to negate a tile
negateTile (Tile x) = Tile (map negateRow x)
	where negateRow = map (\x -> if x == '0' then '1' else '0')


--Used to create a sub list
createSubTile (Tile xs) (xPos) (yPos) xsize ysize = Tile (splitList yPos ysize $ map (splitList xPos xsize) xs)

splitList startPos length xs = take (length) (drop (startPos) xs)

removeLastTileLine (Tile xs) = Tile (take (length xs-1)xs)


--Used to or tiles
orTiles p q = negateTile( conjunctTiles (negateTile p) (negateTile q))


--Used to Pretty Print a tile
prettyPrint :: TileExp -> IO ()
prettyPrint (Tile xs) = putStrLn $ id $ intercalate "\n" xs


--question1 (Tile ["1"]) (Tile ["0"])
question1 (inp1) (inp2) = prettyPrint tile4
	where tile1 = combineTilesRight inp1 inp2
	      tile2 = duplicateTileRight tile1 32
	      tile3 = combineTilesDown tile2 (rotateTile180Degrees tile2)
	      tile4 = duplicateTileDown tile3 32



--question2 (Tile ["0001","0011","0111","1111"])
question2 (inp) = prettyPrint $ tile5
	where tile1 = squareRotateTile inp
              tile2 = combineTilesRight (tile1) (tile1)
              tile3 = combineTilesRight (tile2) (combineTilesDown inp (rotateTile270Degrees inp))
	      tile4 = combineTilesDown (tile3) (combineTilesRight (combineTilesDown tile1 (combineTilesRight inp (rotateTile90Degrees inp))) (scaleTile inp 3))
              tile5 = squareRotateTile tile4

--question3 (Tile ["000", "000", "011"])
question3 (inp) = prettyPrint $ tile6
	where tile1 = combineTilesRight (combineTilesRight inp (reflectTileY inp)) (createBlankTile inp)
	      tile2 = combineTilesRight (combineTilesRight (createBlankTile inp) (reflectTileX inp)) (reflectTileXY inp)
	      baseTile = combineTilesDown tile1 tile2
	      tile3 = combineTilesRight (baseTile) (reflectTileX baseTile)
	      tile4 = combineTilesDown (tile3) (tile3)
	      tile5 = duplicateTileRight tile4 10
	      tile6 = duplicateTileDown tile5 30

--question4 (Tile ["11","00"]) (Tile ["00","11"]) (Tile ["01","10"])
-- question4 :: TileExp -> TileExp -> TileExp -> [[Char]]
{-
question4 inp1 inp2 inp3 = prettyPrint $ newFinal
	where 
		  initialList = [map (\y -> (x,y)) [0..49] | x <- [0..49]]
		  toFillList = map (map (\x -> if snd x < 25 && fst x + snd x <50 then '1' else if snd x>=25 && fst x<=snd x then '2' else '#')) initialList
		  tile1 = conjunctTiles inp1 (negateTile inp3)
		  tile2 = conjunctTiles inp2 (negateTile inp3)
		  lineToTiles = map (map (\x -> if x == '1' then tile1 else if x == '2' then tile2 else (createBlankTile (tile1)))) toFillList
		  tilesToTextLine = map (foldr combineTilesRight (createBlankTile inp1)) lineToTiles 
		  final = foldr combineTilesDown (Tile [""]) tilesToTextLine
		  newFinal = removeLastTileLine final
-}

--question5 (Tile ["1100000011", "1100000011", "0011001111", "0011001111", "0000110011", "0000110011", "0011001111", "0011001111", "1111111111", "1111111111"])
{-
question5 (inp) = prettyPrint $ tile4
	where tile1 = duplicateTileRight (createSubTile inp 0 0 6 6) 3
		tile2 = duplicateTileRight (createSubTile inp 2 2 6 6) 3
		tile3 = duplicateTileRight (createSubTile inp 4 4 6 6) 3
		tile4 = combineTilesDown (combineTilesDown tile1 tile2) tile3
-}


--question6 (Tile ["111","111","111"]) (Tile ["010","111"],"010") (Tile ["101,010,101"])
question6 inp1 inp2 inp3 = prettyPrint $ inp1


--question7 (Tile ["01","10"])
question7 inp1 = prettyPrint $ inp1



--question8 (Tile ["101","001","110"]) (Tile ["010","101","101"])
question8 inp1 inp2 = prettyPrint $ inp1



--question9 (Tile ["010","101","010"])
question9 inp1 = prettyPrint $ inp1


--question10 (Tile ["00000000000000000000", "00000011111111000000", "00000111111111100000", "00001111111111110000", "00011111111111111000", "00111001111110011100", "00111001111110011100", "00111111111111111100", "01111111111111111110", "01111111111111111110", "01111111111111111110", "01111111111111111110", "00111111111111111100", "00111001111111001100", "00111100000000011100", "00011111111111111000", "00001111111111110000", "00000111111111100000", "00000011111111000000", "00000000000000000000"]) (Tile ["11111","10101","11011","10101","11111"])
question10 inp1 inp2 = prettyPrint $ tile6
	where tile1 = createSubTile inp1 0 0 999999 12
	      tile2 = createSubTile inp1 0 12 12 5
	      tile3 = createSubTile inp1 17 12 999999 5
	      tile4 = createSubTile inp1 0 17 999999 999999
	      tile5 = combineTilesRight (combineTilesRight tile2 inp2) tile3
	      tile6 = combineTilesDown (combineTilesDown(tile1) (tile5)) tile4
