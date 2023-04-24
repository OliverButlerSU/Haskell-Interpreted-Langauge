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
    doNothing { TokenDoNothing _ }

    --Basic code syntax
    '='    { TokenEq _ }
    '('    { TokenLParen _ } 
    ')'    { TokenRParen _ }
    '{'    { TokenLSquig _ }
    '}'    { TokenRSquig _ }
    ';'    { TokenSemiColon _ }
    ','    { TokenComma _ }

    --Boolean Logic
    true   { TokenTrue _ }
    false  { TokenFalse _ }
    '&&'   { TokenAnd _ }
    '||'   { TokenOr _ }
    '!'    { TokenNot _ }
    '<'    { TokenLessThan _ }
    '>'    { TokenMoreThan _ }

    --Integer Logic
    '+'    { TokenPlus _ }
    '-'    { TokenMinus _ }
    '*'    { TokenTimes _ }
    '/'    { TokenDiv _ }
    '^'    { TokenExponential _ }

    --If/While
    if     { TokenIf _ }
    while  { TokenWhile _ }
    else   { TokenElse _ }

    --Tile Functions:
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

    --Variable Name
    tileVar    { TokenTileVar _ $$ }


%left '&&' '||'
%left '!'
%left '+' '-' 
%left '*' '/'
%left '^'
%left NEG
%left ';'
%nonassoc if
%nonassoc while
%nonassoc else
%nonassoc '<' '>'
%nonassoc int true false doNothing '{' '}' '(' ')' '.' ','
%nonassoc tileVar
--$nonassoc tileline

%% 
MultiExp : Exp ';' MultiExp                             { MultiExpr $1 $3}
         | Exp ';'                                      { $1 }

Exp : '(' Exp ')'                                                   { $2 }
    | if '(' ExpBool ')' '{' MultiExp '}' else '{' MultiExp '}'     { ExpIf $3 $6 $10 } 
    | while '(' ExpBool ')' '{' MultiExp '}'		                { ExpWhile $3 $6 }
    | tileVar '=' ExpTile       		                { ExpSetTileVar $1 $3 }
    | print ExpTile                                     { ExpPrint $2 }
    | doNothing                                         { ExpDoNothing }

ExpInt : int                                            { IntVal $1}
       | '-' ExpInt %prec NEG      			            { IntNegate $2 } 
       | ExpInt '+' ExpInt            			        { IntPlus $1 $3 } 
       | ExpInt '-' ExpInt            		            { IntMinus $1 $3 } 
       | ExpInt '*' ExpInt            			        { IntTimes $1 $3 } 
       | ExpInt '/' ExpInt            			        { IntDivide $1 $3 }
       | ExpInt '^' ExpInt	     			            { IntExponential $1 $3 } 
       | '(' ExpInt ')'                                 { $2 }

ExpBool : true                                  { BoolTrue }
        | false                                 { BoolFalse }
        | ExpBool '&&' ExpBool                  { BoolAnd $1 $3 }
        | ExpBool '||' ExpBool                  { BoolOr $1 $3 }
        | '!' ExpBool                           { BoolNot $2 }
        | ExpInt '<' ExpInt                     { BoolLessThan $1 $3 }
        | ExpInt '<' '=' ExpInt                 { BoolLessEqualThan $1 $4 }
        | ExpInt '>' ExpInt                     { BoolMoreThan $1 $3 }
        | ExpInt '>' '=' ExpInt                 { BoolMoreEqualThan $1 $4 }
        | ExpInt '=' '=' ExpInt                 { BoolEqual $1 $4 }
        | ExpInt '!' '=' ExpInt                 { BoolNotEqual $1 $4 }
        | '(' ExpBool ')'                       { $2 } 

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
        | '(' ExpTile ')'                               { $2 } 

{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = ExpSetTileVar String ExpTile
         | MultiExpr Exp Exp
         | ExpPrint ExpTile
         | ExpIf ExpBool Exp Exp
         | ExpWhile ExpBool Exp
         | ExpDoNothing
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

data ExpInt = IntVal Int
            | IntNegate ExpInt
            | IntPlus ExpInt ExpInt
            | IntMinus ExpInt ExpInt
            | IntTimes ExpInt ExpInt
            | IntDivide ExpInt ExpInt
            | IntExponential ExpInt ExpInt
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