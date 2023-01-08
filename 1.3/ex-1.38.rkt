#lang sicp

; compute a k-term finite continued fraction

(define (cont-frac n d k)
  (define (try i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (inc i))))))
  (try 1))

; it takes k=11 to compute the inverse of the golden ratio correct to 4 decimal places
(define e (+ 2
             (cont-frac (lambda (i) 1.0)
                        (lambda (i)
                          (if (= (modulo (+ i 1) 3) 0)
                              i
                              1)) 100)))
e

