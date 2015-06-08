(defn is-prime? 
 [n]
 "Determines if the passed number is prime"
 (defn evenly-divisible?
   [div]
   (if (== (mod n div) 0)
     true
     false))
 (cond
   (== 1 n) false
   (and (== (mod n 2) 0) (not= n 2)) false ;2 is a prime number so we have to add check 
   (not= (count (filter evenly-divisible? (range 3 (Math/sqrt (+ n 1)) 2))) 0) false
   :else true))




(println 
 (reduce +
  (take 1000
        (filter is-prime? (range)))))
