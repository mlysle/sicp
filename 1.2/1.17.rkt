#lang sicp

(define (double a) (* 2 a))
(define (halve a) (/ a 2))

(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult (double a) (halve (dec b)))))))

(mult 50 4)
