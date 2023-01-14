#lang simply-scheme

; 1. See ../1.1/ex-1.6.rkt

; 2.
(define (square x) (* x x))

(define (squares numbersentence)
  (if (empty? numbersentence)
    '()
    (sentence (square (first numbersentence))
              (squares (butfirst numbersentence)))))
(squares '(2 3 23 232))
