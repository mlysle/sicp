#lang sicp

(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (identity x) x)

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (filtered-accumulate combiner null-value filter? term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter? a) (term a) null-value)
                (filtered-accumulate combiner null-value filter? term (next a) next b))))

(define (product term filter? a next b)
  (filtered-accumulate * 1 filter? term a next b))
(define (sum term filter? a next b)
  (filtered-accumulate + 0 filter? term a next b))


(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 prime? square a inc b))

(define (product-of-relative-primes a b)
  (define (relativeprime? i)
    (if (= (gcd i b) 1)
        #t
        #f))
  (filtered-accumulate * 1 relativeprime? identity a inc b))

(product-of-relative-primes 1 5)
