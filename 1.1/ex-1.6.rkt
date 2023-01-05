#lang sicp

(define (square x)
  (* x x))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;    guess
;    (sqrt-iter (improve guess x) x)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs(- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

;(sqrt-iter 1.0 2)

; Since Alyssa has redefined if as an ordinary procedure, the interpreter will evaluate it under applicative order rules.
; When the interpreter gets to (new-if (good-enough? guess x)) it will first evaluate the operands.
; The operand (good-enough? guess x) will evaluate to true or false, which will be passed to the new-if procedure.
; However, the new-if procedure expects three formal parameters so it won't be able to return any value for else-clause or then-clause.
