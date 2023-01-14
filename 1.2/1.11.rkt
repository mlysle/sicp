#lang sicp
; recurssive
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))
(f 10)

; iterative
(define (f-iter n a b c)
  (if (< n 3)
    a
    (f-iter (+ a (* 2 b) (* 3 c)) a b (dec n))))

(f-iter 2 1 0 10)
