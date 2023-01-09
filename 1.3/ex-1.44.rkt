#lang sicp

(define (square x) (* x x))
(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f (+ x dx))
          (f x))
       3)))

(define (smooth-repeated f n)
  ((repeated smooth n) f))

