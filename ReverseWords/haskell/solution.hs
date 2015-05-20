import System.Environment (getArgs)

main = do
  [inpFile] <- getArgs
  file <- readFile inpFile
  mapM_ putStrLn $ map unwords $ map reverseWords $ filter (/=[]) $ map words $ lines file

reverseWords [] = []
reverseWords (x:xs) = (reverseWords xs) ++ [x]
