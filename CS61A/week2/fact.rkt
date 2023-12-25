#lang simply-scheme

; Extra Exercise
; Define a factorial proecedure without global names.

((lambda (n)
   ((lambda (fn)
      (if (equal? n 0)
        1
        (* n (fn (- n 1) fn))))
    (lambda (n fn)
      (if (equal? n 0)
        1
        (* n (fn (- n 1) fn))))))
 0)
