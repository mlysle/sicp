#lang sicp

; compute a k-term finite continuous fraction

(define (cont-frac n d k)
  (define (try i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (inc i))))))
  (try 1))

; calculate e as a k-term finite continuous fraction
(define e (+ 2
             (cont-frac (lambda (i) 1.0)
                        (lambda (i)
                          (if (= (modulo (+ i 1) 3) 0)
                              i
                              1)) 100)))
e

