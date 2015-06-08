main = do
  let
    sumOfOneThousandPrimes = sum $ take 1000 $ filter (isPrime) [2..]
  putStrLn $ show sumOfOneThousandPrimes
  return ()


isPrime:: Int -> Bool
isPrime num
  | num `mod` 2 == 0 && num /= 2 = False
  | length (filter (==0) $ map (mod num) [3,5..rootNum]) /= 0 = False
  | otherwise = True
  where rootNum = ceiling (sqrt (fromIntegral num))
    
