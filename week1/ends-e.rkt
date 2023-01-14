#lang simply-scheme

(define (ends-e words)
  (cond ((empty? words) '())
        ((equal? (last (first words)) 'e) (sentence (first words) (ends-e (butfirst words))))
        (else (sentence (ends-e (butfirst words))))))

(ends-e '(please put the salami above the blue elephant))
