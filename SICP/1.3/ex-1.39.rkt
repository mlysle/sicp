#lang sicp

; compute a k-term finite continuous fraction

(define (cont-frac n d k)
  (define (try i)
    ;(newline)
    ;(display '(numerator: )) (display (n i)) (display '(denominator: )) (display(d i))
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (inc i))))))
  (try 1))

; calculate tan(x) as a k-term finite continuous fraction
(define (tan-cf x k)
     (cont-frac (lambda (i)
                  (if (equal? i 1)
                     x 
                     (- (* x x))))
                (lambda (i)
                  (- (* 2 i) 1))
                k))
(tan-cf 1.0 100)
(tan 1.0)
