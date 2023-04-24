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
$white+       ; 
  "--".*        ;
  $binary+ { (\p s -> TokenTileLine p s) }
  $digit+	{ (\p s -> TokenInt p (read s)) }
  true		{ (\p s -> TokenTrue p) }
  false   { (\p s -> TokenFalse p) }
  "&&"    { (\p s -> TokenAnd p) }
  "||"    { (\p s -> TokenOr p) }
  "!"     { (\p s -> TokenNot p) }
  \<			{ (\p s -> TokenLessThan p) }
  \>      { (\p s -> TokenMoreThan p) }
  \+			{ (\p s -> TokenPlus p) }
  \-			{ (\p s -> TokenMinus p) }
  \*			{ (\p s -> TokenTimes p) }
  \/			{ (\p s -> TokenDiv p) }
  \^			{ (\p s -> TokenExponential p) }
  if			{ (\p s -> TokenIf p) }
--  while		{ (\p s -> TokenWhile p) }
  else		{ (\p s -> TokenElse p) }
  doNull  { (\p s -> TokenDoNull p) }
  \=			{ (\p s -> TokenEq p ) }
  \(			{ (\p s -> TokenLParen p) }
  \)			{ (\p s -> TokenRParen p) }
  \{      { (\p s -> TokenLSquig p) }
  \}      { (\p s -> TokenRSquig p) }
  \;      { (\p s -> TokenSemiColon p) }
--  $alpha [$alpha $digit \_ \’]*   { (\p s -> TokenVar p s) } 

{

-- The token type: 
data Token =
  TokenTileLine AlexPosn String  |  
  TokenInt AlexPosn Int          | 
  TokenTrue AlexPosn             |
  TokenFalse AlexPosn            |
  TokenAnd AlexPosn              |
  TokenOr AlexPosn               |
  TokenNot AlexPosn              |
  TokenLessThan AlexPosn         |
  TokenMoreThan AlexPosn         |
  TokenPlus AlexPosn             |
  TokenMinus AlexPosn		         |
  TokenTimes AlexPosn		         |
  TokenDiv AlexPosn		           |
  TokenExponential AlexPosn	     |
  TokenIf AlexPosn               |
--  TokenWhile AlexPosn		         |
  TokenElse AlexPosn             |
  TokenDoNull AlexPosn           |
  TokenEq AlexPosn               |
  TokenLParen AlexPosn           |
  TokenRParen AlexPosn           |
  TokenLSquig AlexPosn           |
  TokenRSquig AlexPosn           |
  TokenSemiColon AlexPosn        
--  TokenVar AlexPosn String
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenTileLine  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNot  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMoreThan  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTimes  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiv  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExponential  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDoNull (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLSquig (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRSquig (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
-- tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)

}