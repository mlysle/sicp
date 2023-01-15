#lang sicp

(define (pascal row col)
  (if (or (= col 1) (= col row))
    1
    (+ (pascal (dec row) col) (pascal (dec row) (dec col)))))
