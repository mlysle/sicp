#lang racket
(require berkeley)

; check if last letter is y and the preceding letter is not a vowel (i.e. a consonant)
(define (uses-ies-ending? wd)
  (and (equal? (last wd) 'y)
       (not (member? (last (butlast wd))
                     '(a e i o u)))))

(define (plural wd)
  (if (uses-ies-ending? wd)
      (word (butlast wd) 'ies)
      (word wd 's)))
