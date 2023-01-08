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
  (/ x
     (+ 1
        (cont-frac (lambda (i)
                     (- (* x x)))
                   (lambda (i)
                     (+ 1 (* 2 i)))
                   k))))


(tan-cf 1.0 10)
(tan 1.0)
