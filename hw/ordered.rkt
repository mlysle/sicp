#lang simply-scheme

(define (ordered? numbers)
  (if (empty? numbers) '(A sentence of numbers is required.)
    (ascending? numbers)))

(define (ascending? numbers)
  (cond ((empty? (butfirst numbers)) #t)
        ((< (first numbers) (first (butfirst numbers))) (ascending? (butfirst numbers)))
        (else #f)))


(ordered? '(1 2 0 4 5))

; If numbers are empty return an error message.
; Otherwise, check if there are any more numbers.
; If this is the last number, the string is sorted.
; Otherwise, check if the next number is greater than the current number.
; If true, loop. If false, numbers are not sorted.
