#lang sicp

(define (square x) (* x x))

(define (fast-expt b n)
  (define (fast-expt-helper a b n)
    (cond ((= n 0) a)
     ((even? n) (fast-expt-helper a (square b) (/ n 2)))
     (else (fast-expt-helper (* a b) b (- n 1)))))
          
  (fast-expt-helper 1 b n))

(fast-expt 2 5)
