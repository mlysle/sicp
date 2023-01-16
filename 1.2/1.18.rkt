#lang sicp

(define (double a) (* 2 a))
(define (halve a) (/ a 2))

(define (mult a b)
 (define (mult-helper product a b)
   (cond ((= b 0) product)
      ((even? b) (mult-helper product (double a) (halve b)))
      (else (mult-helper (+ a product) a (dec b)))))
 (mult-helper 0 a b))

(mult 4 5)
