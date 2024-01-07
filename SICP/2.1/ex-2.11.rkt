#lang sicp

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (pos? x) (>= x 0))
(define (neg? x) (< x 0))

(define (mul-interval x y)
  (let* ((lbx (lower-bound x))
         (ubx (upper-bound x))
         (lby (lower-bound y))
         (uby (upper-bound y))
         (p1 (* lbx lby))
         (p2 (* lbx uby))
         (p3 (* ubx lby))
         (p4 (* ubx uby)))
    (cond ((and (pos? lbx) (pos? ubx) (pos? lby) (pos? uby)) (make-interval p1 p4))
          ((and (neg? lbx) (neg? ubx) (neg? lby) (neg? uby)) (make-interval p1 p4))
          ((and (pos? lbx) (pos? ubx) (neg? lby) (neg? uby)) (make-interval p4 p1))
          ((and (neg? lbx) (pos? ubx) (pos? lby) (pos? uby)) (make-interval p1 p4))
          ((and (neg? lbx) (neg? ubx) (pos? lby) (pos? uby)) (make-interval p2 p3))
          ((and (neg? lbx) (pos? ubx) (neg? lby) (neg? uby)) (make-interval p4 p2))
          ((and (neg? lbx) (neg? ubx) (neg? lby) (pos? uby)) (make-interval p2 p1))
          ((and (pos? lbx) (pos? ubx) (neg? lby) (pos? uby)) (make-interval p3 p4))
          ((and (neg? lbx) (pos? ubx) (neg? lby) (pos? uby)) (make-interval (min p1 p2 p3 p4)
                                                                            (max p1 p2 p3 p4))))))