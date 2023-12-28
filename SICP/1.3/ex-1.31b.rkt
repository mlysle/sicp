#lang sicp

(define (identity x) x)
(define (inc x) (+ 1 x))

(define (product-recur term a next b)
  (if (> a b)
      1 (* (term a)
           (product-recur term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(product-iter identity 1 inc 5)
