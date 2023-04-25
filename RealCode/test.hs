import System.IO
import Control.Monad

data TileVar = Tile [String]

getFile = do    
    let list = []
    handle <- openFile "tile1.tl" ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = singlewords
    hClose handle
    return (Tile list)