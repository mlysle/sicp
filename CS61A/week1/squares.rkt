#lang racket
(require berkeley)

(define (square x) (* x x))

(define (squares numbersentence)
  (if (empty? numbersentence)
    '()
    (sentence (square (first numbersentence))
              (squares (butfirst numbersentence)))))
(squares '(2 3 23 232))
