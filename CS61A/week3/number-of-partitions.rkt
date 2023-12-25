#lang sicp
; the key to solving this one is realizing that its the coin-counting problem from earlier, but with numbers (as part 2 alludes to).
; 'level' isn't a very useful word, but I couldn't think of an alternative that didn't sound like n.
(define (number-of-partitions n)
  (define (sum-partitions n level)
    (cond ((equal? n 0) 1) ; base case, zero has one partition
          ((or (equal? level 0) (< n 0)) 0) ; for when you're all out of numbers, and for when you've gone below zero (this is NOT redundant to the same check in the first procedure).
          (else
           (+ (sum-partitions n (dec level)) ; if n=5, then this will find all the partitions of 5 using numbers 1-4
              (sum-partitions (- n level) level))))) ; if n=5, then this will find all the partitions of 0 using the numbers 1-5
  (if (< n 0)
    '(expected a positive n)
    (sum-partitions n n)))
 
(number-of-partitions 5)
(number-of-partitions 6)

; 2. Counting partitions is like making change, where the coins are numbers

; 3. No idea, maybe I'll come back to it.
