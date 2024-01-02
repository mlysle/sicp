#lang racket
(require berkeley)

(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1) ((< (best-total dealer-hand-so-far) 17)) (play-dealer customer-hand (se dealer-hand-so-far (first rest-of-deck)) (bf rest-of-deck)) ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
          ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
          (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
          ((strategy customer-hand-so-far dealer-up-card)
           (play-customer (se customer-hand-so-far (first rest-of-deck))
                          dealer-up-card
                          (bf rest-of-deck)))
          (else
           (play-dealer customer-hand-so-far
                        (se dealer-up-card (first rest-of-deck))
                        (bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
                   (first (bf (bf deck)))
                   (bf (bf (bf deck))))))

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)))
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C) 'Joker 'Joker))

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
          (se (first in) (shuffle (se (bf in) out) (- size 1)))
          (move-card (bf in) (se (first in) out) (- which 1))))
    (if (= size 0)
        deck
        (move-card deck '() (random size))))
  (shuffle (make-ordered-deck) 54))

; part 1
(define (rank card)
  (butlast card))

(define (ace? card)
 (member? (rank card) '(a A)))

(define (is-joker? card)
  (equal? card 'Joker))

(define (face-card? card) (member? (rank card) '(J Q K)))

; Sum non-aces, then add the aces afterwards, then sum jokers.
(define (best-total hand)
  (define (sum-cards hand total aces jokers)
    (if (empty? hand) (sum-jokers (sum-aces total aces jokers) jokers)
      (cond ((ace? (first hand)) (sum-cards (butfirst hand) total (inc aces) jokers))
            ((is-joker? (first hand)) (sum-cards (butfirst hand) total aces (inc jokers)))
            ((face-card? (first hand)) (sum-cards (butfirst hand) (+ total 10) aces jokers))
            (else (sum-cards (butfirst hand) (+ total (rank (first hand))) aces jokers)))))
  (define (sum-aces cardsum aces jokers)
    (define (iter elevens ones)
      (let ((totalsum (+ cardsum (* 11 elevens) ones)))
        (if (or (<= totalsum (- 21 jokers)) (= elevens 0))
         totalsum
         (iter (dec elevens) (inc ones)))))
    (iter aces 0))
  (define (sum-jokers cardsum jokers)
    (let ((rem (- 21 cardsum))
          (min jokers)
          (max (* 11 jokers)))
         (cond ((< rem min) (+ cardsum min))
               ((and (>= rem min) (<= rem max)) 21)
               ((> rem max) (+ cardsum max)))))
  (sum-cards hand 0 0 0))

(define (play-n strategy n)
  (if (= n 0)
   0
   (+ (twenty-one strategy) (play-n strategy (dec n)))))

(define (stop-at-17 my-hand upcard)
  (< (best-total my-hand) 17))
