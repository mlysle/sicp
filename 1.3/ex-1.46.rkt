#lang sicp

(define (average x y) (/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
  (lambda (guess x)
    (if (good-enough? guess x)
      guess
      ((iterative-improve
         good-enough?
         improve)
       (improve guess x) x))))

(define (new-sqrt x)
  (define initial-guess 1.0)
  (define (good-enough? guess x)
    (if (< (abs (- (improve guess x) guess)) 0.001)
      #t
      #f))
  (define (improve guess x)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) initial-guess x))

(new-sqrt 100)
