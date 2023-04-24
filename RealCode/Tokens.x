{ 
module Tokens where 
}

%wrapper "posn"
$binary = 0-1 
$digit = 0-9   
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-


  $white+       ; --Ignore white space
  "--".*        ; --Comments
--  $binary+ { (\p s -> TokenTileLine p s) }

  $digit+	{ (\p s -> TokenInt p (read s)) }
--  doNothing  { (\p s -> TokenDoNothing p) } --Does nothing


  --Basic code syntax
  \=			{ (\p s -> TokenEq p ) }
  \(			{ (\p s -> TokenLParen p) }
  \)			{ (\p s -> TokenRParen p) }
  \;      { (\p s -> TokenSemiColon p) }
  \,      { (\p s -> TokenComma p) }


  --Tile Functions:
  combineTilesRight { (\p s -> TokenCTR p) }
  combineTilesDown  { (\p s -> TokenCTD p) }
  duplicateTileRight { (\p s -> TokenDTR p) }
  duplicateTileDown { (\p s -> TokenDTD p) }
  rotateTile90Degrees { (\p s -> TokenRT90 p) }
  rotateTile180Degrees { (\p s -> TokenRT180 p) }
  rotateTile270Degrees {(\p s -> TokenRT270 p) }
  squareRotateTile { (\p s -> TokenSR p) }
  scaleTile { (\p s -> TokenST p) }
  createBlankTile { (\p s -> TokenBlank p) }
  reflectTileX { (\p s -> TokenRTX p) }
  reflectTileY { (\p s -> TokenRTY p) }
  reflectTileXY { (\p s -> TokenRTXY p) }
  print { (\p s -> TokenPrint p) }

  --Variable Name
  $alpha [$alpha $digit \_ \’]*   { (\p s -> TokenTileVar p s) } 

{

-- The token type: 
data Token =
--  TokenTileLine AlexPosn String  |  
  TokenInt AlexPosn Int          | 
--  TokenDoNothing AlexPosn        |
  
  
  --Code Syntax
  TokenEq AlexPosn               |
  TokenLParen AlexPosn           |
  TokenRParen AlexPosn           |
  TokenSemiColon AlexPosn        |
  TokenComma AlexPosn            |


  --Tile Functions:
  TokenCTR AlexPosn              |
  TokenCTD AlexPosn              |
  TokenDTR AlexPosn              |
  TokenDTD AlexPosn              |
  TokenRT90 AlexPosn             |
  TokenRT180 AlexPosn            |
  TokenRT270 AlexPosn            |
  TokenSR AlexPosn               |
  TokenST AlexPosn               |
  TokenBlank AlexPosn            |
  TokenRTX AlexPosn              |
  TokenRTY AlexPosn              |
  TokenRTXY AlexPosn             |
  TokenPrint AlexPosn            | 


  --Variables
  TokenTileVar AlexPosn String

  deriving (Eq,Show) 

tokenPosn :: Token -> String
-- tokenPosn (TokenTileLine  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenDoNothin  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)


--Code Syntax
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


--Tile Functions
tokenPosn (TokenCTR (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCTD (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDTR (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDTD (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRT90 (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRT180 (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRT270 (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSR (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenST (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBlank (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRTX (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRTY (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRTXY (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrint (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


--Variables
tokenPosn (TokenTileVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)

}