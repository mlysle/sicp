#lang racket
(require berkeley)

(define (twenty-one strategy)
  (define (stop-at-17))
  (define (best-total hand)
   (define (rank card) 
    (butlast card))
   (define (ace? card)
    (member? (rank card) '(a A)))
   (define (face-card? card)
    (member? (rank card) '(j J q Q k K)))
   (define (sum-cards hand total aces)
    (if (> total 21)
       '(Bust!)
       (if (empty? hand)
        (sum_aces total aces)
        (cond ((ace? (first hand)) (sum-cards (butfirst hand) total (inc aces))
                 ((face-card? (first hand)) (sum-cards (butfirst hand) (+ total 10) aces))
                 (else (sum-cards (butfirst hand) (+ total (rank (first hand))) aces)))))))
   (define (sum_aces total aces)
     (if (equal? aces 0)
       total
       (cond ((<= (+ total 11) 21) (sum_aces (+ total 11) (dec aces)))
             ((<= (+ total 1) 21) (sum_aces(+ total 1) (dec aces))))))
   (sum-cards hand 0 0))

  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1))
    ((< (best-total dealer-hand-so-far) 17)
     (play-dealer customer-hand))
   (se dealer-hand-so-far (first rest-of-deck)
      (bf rest-of-deck)
    ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
    ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
    (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1))
    ((strategy customer-hand-so-far dealer-up-card)
     (play-customer (se customer-hand-so-far (first rest-of-deck)))
     dealer-up-card
     (bf rest-of-deck))
    (else
     (play-dealer customer-hand-so-far))
   (se dealer-up-card (first rest-of-deck)
      (bf rest-of-deck)))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
       (first (bf (bf deck)))
       (bf (bf (bf deck)))))) 

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)))
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)))

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)))
    (se (first in) (shuffle (se (bf in) out) (- size 1)))
    (move-card (bf in) (se (first in) out) (- which 1))
    (if (= size 0)))
  deck
      (move-card deck '() (random size))
  (shuffle (make-ordered-deck) 52))



