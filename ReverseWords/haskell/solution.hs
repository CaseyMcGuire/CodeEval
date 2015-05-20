import System.Environment (getArgs)

main = do
  [inpFile] <- getArgs
  input <- readFile inpFile


reverseWords [] = []
reverseWords (x:xs) = (reverseWords xs):x
