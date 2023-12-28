#lang sicp

(define (average x y) (/ (+ x y) 2))
(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; without average damping
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)
; with average damping
(fixed-point (lambda (x) (average (/ (log 1000) (log x)) x)) 1.1)
