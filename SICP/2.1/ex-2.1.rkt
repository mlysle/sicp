#lang sicp

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; In math terms, this multiplies the numerator and denominator by -1 when the denominator is negative,
; resulting in a positive denominator without changing the value.
; We divide by the absolute value of gcd because gcd is calculated before any sign changes.
(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (< d 0)
      (cons (/ (- n) g) (/ (- d) g))
      (cons (/ n g) (/ d g)))))
          
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 1 -2))
