{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    int    { TokenInt _ $$ } 
    true   { TokenTrue _ }
    false  { TokenFalse _ }
    '&&'   { TokenAnd _ }
    '||'   { TokenOr _ }
    '!'    { TokenNot _ }
    '<'    { TokenLessThan _ }
    '>'    { TokenMoreThan _ }
    '+'    { TokenPlus _ }
    '-'    { TokenMinus _ }
    '*'    { TokenTimes _ }
    '/'    { TokenDiv _ }
    '^'    { TokenExponential _ }
    if     { TokenIf _ }
    while  { TokenWhile _ }
    else   { TokenElse _ }
    doNull { TokenDoNull _ }
    '='    { TokenEq _ }
    '('    { TokenLParen _ } 
    ')'    { TokenRParen _ }
    '{'    { TokenLSquig _ }
    '}'    { TokenRSquig _ }
    ';'    { TokenSemiColon _ }
    var    { TokenVar _ $$ }

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
%nonassoc int true false var doNull '(' ')' '{' '}'

%% 
MultiExp : Exp ';' MultiExp                     { MultiExpr $1 $3}
         | Exp ';'                              { $1 }

Exp : if '(' ExpBool ')' '{' MultiExp '}' else '{' MultiExp '}'    { ExpIf $3 $6 $10 } 
    | while '(' ExpBool ')' '{' MultiExp '}'		               { ExpWhile $3 $6 }
    | var '=' ExpInt       		                { ExpSetVarInt $1 $3 }
    | '(' MultiExp ')'                          { $2 }
    | doNull                                    { ExpDoNull }                                    

ExpInt : int                                    { IntVal $1}
       | var                                    { IntVar $1}
       | '-' ExpInt %prec NEG      			    { IntNegate $2 } 
       | ExpInt '+' ExpInt            			{ IntPlus $1 $3 } 
       | ExpInt '-' ExpInt            		    { IntMinus $1 $3 } 
       | ExpInt '*' ExpInt            			{ IntTimes $1 $3 } 
       | ExpInt '/' ExpInt            			{ IntDivide $1 $3 }
       | ExpInt '^' ExpInt	     			    { IntExponential $1 $3 } 
       | '(' ExpInt ')'                         { $2 }

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


{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = ExpVar String
         | ExpIf ExpBool Exp Exp
         | ExpWhile ExpBool Exp
         | ExpSetVarInt String ExpInt
         | MultiExpr Exp Exp
         | ExpDoNull
    deriving (Show,Eq)

data ExpInt = IntVal Int
            | IntVar String
            | IntNegate ExpInt
            | IntPlus ExpInt ExpInt
            | IntMinus ExpInt ExpInt
            | IntTimes ExpInt ExpInt
            | IntDivide ExpInt ExpInt
            | IntExponential ExpInt ExpInt
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
} 