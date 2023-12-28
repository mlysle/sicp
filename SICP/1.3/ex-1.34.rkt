#lang sicp
; 1.34
; Q: What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; A: (f f) will substitute the argument f for the formal paramter g in the procedure body (g 2).
; Then the interpreter will apply f with the argument 2. This substitutes 2 for g in the body (g 2).
; (2 2) will fail to evaluate because 2 is not a procedure.
; (f f) -> (f 2) -> (2 2) -> ERROR
(define (f g) (g 2))
(f f)

(f (lambda (x) (* x x)))
