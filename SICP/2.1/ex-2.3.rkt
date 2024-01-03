#lang sicp

; My solution to this exercise may not perfectly satisfy the problem description.

; My original solution defined a rectangle in terms of two segments: its base and height.
; I assumed the segments were axis-aligned when calculating side lengths.
; I then rewrote my solution to work with any rectangle on the plane using the distance formula.
; This is of course "backwards compatible" with my original rectangle implementation.

(define (make-segment a b) (cons a b))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (square x) (* x x))

(define (distance a b)
  (sqrt (+ (square (- (x-point b) (x-point a)))
           (square (- (y-point b) (y-point a))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display (","))
  (display (y-point p))
  (display ")"))

(define (make-rectangle base side)
  (cons base side))

(define square-rect (make-rectangle (make-segment (make-point 0 0)
                                                  (make-point 5 0))
                                    (make-segment (make-point 0 0)
                                                  (make-point 0 5))))

(define rect (make-rectangle (make-segment (make-point 0 0)
                                           (make-point 5 0))
                             (make-segment (make-point 0 0)
                                           (make-point 0 10))))

(define (base rectangle) (car rectangle))
(define (side rectangle) (cdr rectangle))

(define (area rectangle)
  (let* ((base-seg (base rectangle))
         (side-seg (side rectangle))
         (base-length (distance (start-segment base-seg) (end-segment base-seg)))
         (side-length (distance (start-segment side-seg) (end-segment side-seg))))
       (* base-length side-length)))

(define (perimeter rectangle)
  (let* ((base-seg (base rectangle))
         (side-seg (side rectangle))
    
         (base-length (abs (- (x-point (end-segment base-seg))
                              (x-point (start-segment base-seg)))))
         (side-length (abs (- (y-point (end-segment side-seg))
                              (y-point (start-segment side-seg))))))
       (+ (* 2 side-length) (* 2 base-length))))

(area square-rect)
(perimeter square-rect)
