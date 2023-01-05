#lang sicp
; Exercise 1.5

;(define (p) (p))
;(define (test x y)
;  (if (= x 0 ) 0 y))

; (test 0 (p))

; Under applicative-order rules, the intrepreter evaluates the operands before applying the operator.
; In this case, when the interpreter evaluates (p) it causes an infinite loop.
; Under normal-order rules, the operator is evaluated first.
; The operator test evaluates to the predicate expression (= x 0), which evaluates to true, resulting in the consequent expression 0.
; The alternative y AKA (p) is never evaluated unlike under applicative-order rules.
