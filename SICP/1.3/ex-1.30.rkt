#lang sicp

; recurssive sum (for reference)
(define (sum-recur term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recur term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (square x) (* x x))

; iterative sum
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(sum-iter square 1 inc 5)
