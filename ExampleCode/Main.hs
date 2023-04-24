import Tokens
import Grammar
import Evaluator
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           putStrLn ("Lexing : \n" ++ sourceText)
           let lexedProg = (alexScanTokens sourceText)
           putStrLn ("Lexed as \n" ++ (show lexedProg) ++ "\n")
	   let parsedProg = (parseCalc lexedProg)
           putStrLn ("Parsed as \n : " ++ (show parsedProg) ++ "\n")
	   let evalProg = evaluateExp parsedProg (ExpDoNull, [("Test", 1)])
	   putStrLn ("Evaluated as \n : " ++ (show evalProg) ++ "\n")

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()