#lang simply-scheme
; handles the sentence after the first word
(define (switch switchme)
  (define (substitute nextword) 
    (cond ((member? nextword '(i I me Me)) 'you)
          ((equal? nextword 'you) 'me)
          (else nextword)))
  (if (empty? switchme)
    '()
    (sentence (substitute (first switchme)) (switch (butfirst switchme)))))

; only handles first word. Works but needs to be rewritten.
(define (switch_first_word switchtext)
  (if (empty? switchtext)
     '()
     (if (member? (first switchtext) '(you You))
      (sentence 'I (switch (butfirst switchtext)))
      (sentence (first switchtext) (switch (butfirst switchtext))))))
  

(switch_first_word '(You told me that I should wake you up))
