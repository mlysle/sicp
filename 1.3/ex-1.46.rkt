#lang sicp

; Exercise 1.46

(define (average x y) (/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
      guess
      ((iterative-improve
         good-enough?
         improve) (improve guess)))))

(define (sqrt-iter x)
  (define initial-guess 1.0)
  (define (good-enough? guess)
    (< (abs (- (improve guess) guess)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) initial-guess))

(define (fixed-point-iter f)
  (define initial-guess 1.0)
  (define tolerance 0.00001)
  (define (good-enough? guess)
    ;(display (< (abs (- guess (improve guess))) tolerance))
    (newline)
    (< (abs (- guess (improve guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? f) initial-guess))

(sqrt-iter 100)

; while this works, I can't seem to redefine sqrt in terms of fixed-point-iter like in 1.33.
; though luckily the exercise doesn't specify anything about that.
(fixed-point-iter cos)
