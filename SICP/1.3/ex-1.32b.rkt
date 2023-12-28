#lang sicp

(define (inc x) (+ x 1))
(define (identity x) x)

(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recur combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner a result))))
  (iter a null-value))

(define (product term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(product identity 1 inc 4)
