(defn square
  [x]
  (* x x))

(defn divides?
  [a b]
  (== (rem b a) 0))

(defn find-divisor
  [n test-divisor]
  (cond
    (> (square test-divisor) n) n
    (divides? test-divisor n) test-divisor
    :else (find-divisor n (+ test-divisor 1))))

(defn smallest-divisor
  [n]
  (find-divisor n 2))

(defn prime?
  [n]
  (if (== n 1)
    false
    (== n (smallest-divisor n))))

(defn expmod
  [base exp m]
  (cond 
    (== exp 0) 1
    (even? exp) (rem (square (expmod base (/ exp 2) m)) m)
    :else (rem (* base (expmod base (- exp 1) m)) m )))

(defn fermat-test
  [n]
  (defn try-it
    [a]
    (== (expmod a n n) a))
  (try-it (+ 1 (rand-int n))))

(defn fast-prime?
  [n times]
  (cond 
    (== times 0) true
    (fermat-test n) (fast-prime? n (- times 1))
    :else false))

(defn fermat
  [n]
  (fast-prime? n 10))
   

(println
 (reduce + 
         (take 1001
               (filter prime? (range)))))

