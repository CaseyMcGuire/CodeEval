import System.Environment
import System.IO
import Data.List
import Data.Char

main :: IO()
main = do
  [args] <- getArgs
  file <- readFile args
  let
    fileLines = lines file
  mapM_ putStrLn $ map formatListOfInts $ map (\(x,y) -> multiplyLists x y) $ map getLists fileLines
  return ()

--Given two lists, returns a list with the corresponding terms of the two lists multiplied together
multiplyLists :: [Int] -> [Int] -> [Int]
multiplyLists list1 list2 = map (\(x,y) -> x * y) $ zip list1 list2

--converts string of the form "a_num1 a_num2 ... a_numN | b_num1 b_num2 ... b_numN" into a tuple of two lists of
--the form ([a_num1, a_num2, ..., a_numN], [b_num1, b_num2, ..., b_numN])
getLists :: String -> ([Int], [Int])
getLists line = (list1, list2)
  where
    filterSpaces = filter (/=' ') 
    splitFunction f = f (/='|') 
    list1 = stringToIntList $ splitFunction takeWhile line
    list2 = stringToIntList $ tail (splitFunction dropWhile line)

--Convert a string with space delimited numbers (from 0 to 99) into a list of numbers
--ex) "90 0 6" -> [90,0,6]
stringToIntList :: String -> [Int]
stringToIntList [] = []
stringToIntList [x] = [digitToInt x]
stringToIntList (x:y:xs)
  | x /= ' ' && y /= ' ' = (read ([x,y])::Int):(stringToIntList xs)
  | x == ' ' && y /= ' ' = stringToIntList(y:xs)
  | x /= ' ' && y == ' ' = (digitToInt x):(stringToIntList xs)
  | otherwise = stringToIntList xs

--Convert list of ints into a space separated string of numbers.
--ex) [1,2,3,4] -> "1 2 3 4"
formatListOfInts :: [Int] -> String
formatListOfInts list = tail $ foldl (\acc x -> acc ++ " " ++ (show x)) "" list
