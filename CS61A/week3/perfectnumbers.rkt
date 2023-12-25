#lang sicp

; is 'a' a factor of n?
(define (is-factor? n a)
  (equal? (modulo n a) 0))

; it does the trick but could definitely be rewritten
(define (sum-of-factors n i)
  (if (equal? n i)
    0
   (if (is-factor? n i)
     (+ i (sum-of-factors n (inc i)))
     (+ 0 (sum-of-factors n (inc i))))))

(define (next-perf n)
  (if (equal? n (sum-of-factors n 1))
      n
      (next-perf (inc n))))

; calculate perfect numbers
(next-perf 29)
