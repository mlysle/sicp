#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)

(((double (double double)) inc) 5) ; => 21

; results in a procedure that doubles doubles inc 4 time
; or 5+2^4=21.
