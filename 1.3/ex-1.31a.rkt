#lang sicp

(define (identity x) x)
(define (inc x) (+ 1 x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (product term a next b)
  (if (> a b)
      1 (* (term a)
           (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(factorial 4)

(define (pi_wallis n)
  (define (term x)
    (if (odd? x)
        (/ (+ x 1) (+ x 2))
        (/ (+ x 2) (+ x 1))))
  (* 4 (product term 1.0 inc n)))

(pi_wallis 1000.0)
