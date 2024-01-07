#lang sicp

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (lower-bound y))
                               (- (upper-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
 (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval))
     2))

(width (add-interval (make-interval 0 2) ; => width of the interval is the sum of the original interval widths
                     (make-interval 0 4)))

; multiplying different intervals of the same widths can result in products of differing widths
; in other words, this is not a function
(width (mul-interval (make-interval 0 2) ; => 4
                     (make-interval 0 4)))

(width (mul-interval (make-interval 2 4) ; => 12
                     (make-interval 4 8)))
