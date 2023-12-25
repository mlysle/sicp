#lang racket
(require berkeley)

(define (infinite_loop) (infinite_loop))
(define x 0)

; these expressions demonstate how 'or and 'and' are special forms
(if (or (= x 0) (infinite_loop)) ; infinite_loop never evaluated because first condition is true
  #t
  #f)
(if (and (= x 1) (infinite_loop)) ; infinite_loop never evaluated because first condition is false
  #t
  #f)

; treating or as a special form is more computationally efficient.
; treating or as an ordinary procedure could be useful if the evaluation of
; an argument affected the evaluation of another.
