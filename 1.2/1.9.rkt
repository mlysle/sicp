#lang sicp
; This + procedure is recurssive because it invokes itself.
; And it generates a recurssive process because it builds up deferred arguments.
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; This + procedure is recurssive because it it invokes itself.
; Unlike the other procedure however, it doesn't build up any
; deferred arguments, so it generates an itterative process.
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) (inc b)))))
  
