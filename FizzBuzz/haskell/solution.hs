import System.Environment (getArgs)

main = do
  [inpFile] <- getArgs
  file <- readFile inpFile
  mapM_ putStrLn
    $ map unwords
    $ map (\[a,b,c] -> solution a b c)
    $ map words
    $ lines file



solution :: [Char] -> [Char] -> [Char] -> [[Char]]
solution fstDivisor sndDivisor n = map fizzbuzz [1..num]
                                   where fizzbuzz x
                                           | x `mod` first == 0 && x `mod` second == 0 = "FB"
                                           | x `mod` first == 0 = "F"
                                           | x `mod` second == 0 = "B"
                                           | otherwise = show x
                                         first = read fstDivisor::Int
                                         second = read sndDivisor::Int
                                         num = read n::Int
