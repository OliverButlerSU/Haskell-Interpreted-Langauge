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
           --putStrLn ("Lexing : \n" ++ sourceText)
           let lexedProg = (alexScanTokens sourceText)
           --putStrLn ("Lexed as \n" ++ (show lexedProg) ++ "\n")
           let parsedProg = (parseCalc lexedProg)
           --putStrLn ("Parsed as \n : " ++ (show parsedProg) ++ "\n")
           let evalProg = evaluateExp ([parsedProg],[("inp1", Tile ["1"]), ("inp2", Tile ["0"])])
           evalProg

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()