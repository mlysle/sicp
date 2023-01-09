#lang simply-scheme

;; this exercise is incomplete
;; there may be an incompatiblity with racket
;; even using the #sicp dialect.
;;
;; the expected 2^n pattern does not appear
;; so there is no clear method to implement
;; a nth root test for all n.


(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (average-damp f) (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (n-root-repeated n_power n_avg x)
  (fixed-point ((repeated average-damp n_avg)
                (lambda (y) (/ x (expt y (- n_power 1)))))
               1.0))

(n-root-repeated 2 1 100)                            
(n-root-repeated 3 1 100)                            
(n-root-repeated 4 2 100)                         
(n-root-repeated 5 2 100)                            
(n-root-repeated 6 1 100) ; -> converges with only 1 damping                            
(n-root-repeated 7 1 100)                            
