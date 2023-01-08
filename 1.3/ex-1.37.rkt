#lang sicp

; compute a k-term finite continued fraction

(define (cont-frac n d k)
  (define (try i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (inc i))))))
  (try 1))

; it takes k=11 to compute the inverse of the golden ratio correct to 4 decimal places
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(define golden_ratio (/ (+ 1 (sqrt 5)) 2))
(define (inverse x) (/ 1 x))
(inverse golden_ratio)
