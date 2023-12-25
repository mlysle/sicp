#lang sicp
; this exercise took me a while to put together.
; when I realized that my term was a function of k, and not a
; that's when it clicked.
(define (cube a) (* a a a))
(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (* (f (+ a (* k h)))
       (cond ((or (= k 0 ) (= k n)) 1)
             ((even? k) 2)
             (else 4))))
  (* (/ h 3) (sum term 0 inc n)))

(simpsons cube 0.0 1.0 1000)
(integral cube 0 1 .001)
