#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))
          
; this will apply p five times
; because it takes 5 divisions of 12.5 by 3 to reach an angle
; sufficiently small enough to return.

; the process grows in space+time in proportion to log_3(a):
(/ 1.0 (* 3 3 3)) ; 3 steps
(/ 10.0 (* 3 3 3 3 3)) ; 5 steps (+ 2)
(/ 100.0 (* 3 3 3 3 3 3 3)) ; 7 steps (+ 2)
