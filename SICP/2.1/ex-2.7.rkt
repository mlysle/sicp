#lang sicp

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

; min, max will ensure the correct relative positions of the bounds, such as in the case of subtraction (next exercise)
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))
