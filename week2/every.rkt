#lang simply-scheme

(define (every fn sentence_argument)
  (if (empty? sentence_argument)
    '()
    (sentence (fn (first sentence_argument))
              (every fn (butfirst sentence_argument)))))

(define (square x) (* x x))
(every square '(1 2 3 4 5))
(every first '(nowhere man))
