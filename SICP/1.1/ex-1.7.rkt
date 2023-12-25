#lang racket
(require berkeley)

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs(- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; This method is imprecise for small numbers:
(sqrt 0.000000001) ; => ~0.031250
(square (sqrt 0.000000001)) ; => ~0.000977
(abs (- 0.000000001 0.000977)) ; < 0.001
; this happens because the seemingly small tolerance is too large when comparing numbers at extremely small scale.

; As the input value increases:
; (sqrt 1000000000000000000000000000000) ; => 1e15
; (sqrt 10000000000000000000000000000000000) ; => 1e17
; (sqrt 100000000000000000000000000000000000000) ; => 1e19
; (sqrt 1000000000000000000000000000000000000000000) ; => 1e21
; (sqrt 10000000000000000000000000000000000000000000000) ; => (infinite loop)
; Somewhere between 1e14 and 1e15, the interpreter fails to compute a square root.
; This happen because it never arrives at a guess that passes the good-enough? procedure.
; So the program attempts to improve the guess ad-infitinum.
; Why isn't it ever good enough? It isn't ever good enough because extremely large numbers must be approximated.
; At some point, improving the guess results in an identical guess because of rounding.
; When this happens, the program enter an infinite loop.

; Alternative Method

(define (alt-sqrt x)
  (alt-sqrt-iter 1.0 x))

(define (alt-sqrt-iter guess x)
  (if (alt-good-enough? guess x)
    guess
    (alt-sqrt-iter (improve guess x) x)))

(define (alt-good-enough? guess x)
  (< (abs(- (improve guess x) guess)) 0.001))

(square (alt-sqrt 1e15))
; This method performs poorly with small numbers, but better than sqrt at large numbers.
