#lang racket

; in λ-Calculus, x = 0, (f x) = 1, (f (f x)) = 2...
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

; In order to translate Church numbers, we need a definition of f:
(define (f x) (+ x 1))

; (n f) applies f n many times
; the outer f applies increments the number of applications of f.
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(((add-1 two) f) 0)

; this video helped out a lot:
; https://www.youtube.com/watch?v=DC-9wWgXQTc&plid=PLXaqTeMx01E_eK1ZEpKvKL5KwSaj7cJW9&index=23&t=901
(define (add n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

(((add one three) f) 0)
