#lang sicp

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
 (if (= counter 0)
   product
   (expt-iter b
              (- counter 1)
              (* b product))))
              

; relate b, n, counter, product

; b^n is equal to the product of b^counter and the product variable.
