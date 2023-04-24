{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token
--    tileLine { TokenTileLine _ $$ }
    int    { TokenInt _ $$ } 
--     doNothing { TokenDoNothing _ }

    '='    { TokenEq _ }
    '('    { TokenLParen _ } 
    ')'    { TokenRParen _ }
    ';'    { TokenSemiColon _ }
    ','    { TokenComma _ }

    combineTilesRight { TokenCTR _ }
    combineTilesDown  { TokenCTD _ }
    duplicateTileRight { TokenDTR _ }
    duplicateTileDown { TokenDTD _ }
    rotateTile90Degrees { TokenRT90 _ }
    rotateTile180Degrees { TokenRT180 _ }
    rotateTile270Degrees { TokenRT270 _ }
    squareRotateTile { TokenSR _ }
    scaleTile { TokenST _ }
    createBlankTile { TokenBlank _ }
    reflectTileX { TokenRTX _ }
    reflectTileY { TokenRTY _ }
    reflectTileXY { TokenRTXY _ }
    print { TokenPrint _ }

    tileVar    { TokenTileVar _ $$ }


%left ';'
%nonassoc int var '(' ')' '.' ','
%nonassoc tileVar
--$nonassoc tileline
--%nonassoc doNothing

%% 
MultiExp : Exp ';' MultiExp                             { MultiExpr $1 $3}
         | Exp ';'                                      { $1 }

Exp : '(' Exp ')'                                       { $2 } 
    | tileVar '=' ExpTile       		                { ExpSetTileVar $1 $3 }
    | print ExpTile                                     { ExpPrint $2 }

ExpInt : int                                            { IntVal $1}
       | '(' ExpInt ')'                                 { $2 }

ExpTile : tileVar                                       { TileVar $1 }
        | combineTilesRight '(' ExpTile ',' ExpTile ')' { TileCTR $3 $5 }
        | combineTilesDown '(' ExpTile ',' ExpTile ')'  { TileCTD $3 $5 }
        | duplicateTileRight '(' ExpTile ',' ExpInt ')' { TileDTR $3 $5 }
        | duplicateTileDown '(' ExpTile ',' ExpInt ')'  { TileDTD $3 $5 }
        | rotateTile90Degrees '(' ExpTile ')'           { TileRT90 $3 }
        | rotateTile180Degrees '(' ExpTile ')'          { TileRT180 $3 }
        | rotateTile270Degrees '(' ExpTile ')'          { TileRT270 $3 }
        | squareRotateTile '(' ExpTile ')'              { TileSRT $3 }
        | scaleTile '(' ExpTile ',' ExpInt ')'          { TileST $3 $5 }
        | createBlankTile '(' ExpTile ')'               { TileCBT $3 }
        | reflectTileX '(' ExpTile ')'                  { TileRTX $3 }
        | reflectTileY '(' ExpTile ')'                  { TileRTY $3 }
        | reflectTileXY '(' ExpTile ')'                 { TileRTXY $3 }

{ 
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

} 