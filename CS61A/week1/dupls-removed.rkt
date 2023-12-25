#lang racket
(require berkeley)

(define (dupl-word words)
  (if (member? (first words) (butfirst words))
      '()
       (first words)))

(define (dupls-removed words)
  (if (empty? words)
    '()
    (sentence (dupl-word words) (dupls-removed (butfirst words)))))

(dupls-removed '(a b c a e d e b))
(dupls-removed '(a b c))
(dupls-removed '(a a a a b a a))
