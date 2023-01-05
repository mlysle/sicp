#lang sicp
; Exercise 1.3
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square a) (* a a))
(square 3)
(define (sum_of_squares a b) (+ (square a) (square b)))
(define (sum_of_larger_squares x y z)
  (cond ((and (> x z) (> y z)) (sum_of_squares x y))
       ((and (> x y) (> z y)) (sum_of_squares x z))
       (else (sum_of_squares y z))))
(sum_of_larger_squares 10 0 3)
