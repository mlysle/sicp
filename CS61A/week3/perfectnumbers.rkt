#lang sicp

; is 'a' a factor of n?
(define (is-factor? a n)
  (equal? (modulo n a) 0))

(define (sum-of-factors n i sum)
  (if (equal? i n)
    sum
    (if (is-factor? i n)
      (sum-of-factors n (inc i) (+ sum i))
      (sum-of-factors n (inc i) sum))))

(define (next-perf n)
  (if (equal? n (sum-of-factors n 1 0))
      n
      (next-perf (inc n))))

; calculate perfect numbers
(next-perf 29)
