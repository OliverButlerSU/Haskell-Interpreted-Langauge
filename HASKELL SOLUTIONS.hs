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





--Used to Pretty Print a tile (OLD MAYBE USE THO??)
--prettyPrint :: TileExp -> IO ()
--prettyPrint (Tile [x]) = putStrLn $ id x
--prettyPrint (Tile (x:xs)) = do
--			putStrLn $ id x
--			prettyPrint (Tile xs)

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
	      tile3 = combineTilesRight (baseTile) (reflectTileY baseTile)
	      tile4 = combineTilesDown (tile3) (reflectTileX tile3)
	      tile5 = duplicateTileRight tile4 10
	      tile6 = duplicateTileDown tile5 30