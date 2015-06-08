main :: IO()
main =  do
  let
    largestPalindromePrime = maximum $ filter (\x -> isPrime x && isPalindromeNumber x) [1..999]
  putStrLn $ show largestPalindromePrime
  return ()

isPalindromeNumber :: Int -> Bool
isPalindromeNumber num = (show num) == (reverse $ show num)
  
isPrime :: Int -> Bool
isPrime num
  | num `mod` 2 == 0 = False
  | length (filter (==0) $ map (mod num) [3,5..(num-1)]) /= 0 = False
  | otherwise = True
