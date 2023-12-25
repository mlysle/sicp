#lang racket
(require berkeley)

; handles the sentence after the first word
(define (switch_sentence switchme)
  (define (substitute nextword) 
    (cond ((member? nextword '(i I me Me)) 'you)
          ((equal? nextword 'you) 'me)
          (else nextword)))
  (if (empty? switchme)
    '()
    (sentence (substitute (first switchme)) (switch_sentence (butfirst switchme)))))

; handles the first word, then passes the rest of the sentence to switch_sentence
(define (switch switchtext)
  (if (empty? switchtext)
     '()
     (if (member? (first switchtext) '(you You))
      (sentence 'I (switch_sentence (butfirst switchtext)))
      (sentence (first switchtext) (switch_sentence (butfirst switchtext))))))

(switch '(You told me that I should wake you up))
