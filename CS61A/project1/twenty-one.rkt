#lang racket
(require berkeley)

(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
          ((< (best-total dealer-hand-so-far) 17)
           (play-dealer customer-hand
                        (se dealer-hand-so-far (first rest-of-deck))
                        (bf rest-of-deck)))
          ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
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
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)))

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
          (se (first in) (shuffle (se (bf in) out) (- size 1)))
          (move-card (bf in) (se (first in) out) (- which 1))))
    (if (= size 0)
        deck
        (move-card deck '() (random size))))
  (shuffle (make-ordered-deck) 52))

; part 1
(define (rank card)
  (butlast card))

(define (ace? card)
 (member? (rank card) '(a A)))

(define (face-card? card) (member? (rank card) '(J Q K)))

; Sum non-aces, then add the aces afterwards
(define (best-total hand)
  (define (sum-cards hand total aces)
    (if (empty? hand) (sum_aces total aces)
      (cond ((ace? (first hand)) (sum-cards (butfirst hand) total (inc aces)))
            ((face-card? (first hand)) (sum-cards (butfirst hand) (+ total 10) aces))
            (else (sum-cards (butfirst hand) (+ total (rank (first hand))) aces)))))
  (define (sum_aces cardsum aces)
    (define (iter elevens ones)
      (let ((totalsum (+ cardsum (* 11 elevens) ones)))
        (if (or (<= totalsum 21) (= elevens 0))
         totalsum
         (iter (dec elevens) (inc ones)))))
    (iter aces 0))
  (sum-cards hand 0 0))
; 10 A A

; part 2
(define (play-n strategy n)
  (if (= n 0)
   0
   (+ (twenty-one strategy) (play-n strategy (dec n)))))

; part 3
(define (stop-at-17 my-hand upcard)
  (< (best-total my-hand) 17))

; part 4
(define (dealer-sensitive my-hand upcard)
  (cond ((and (member? upcard '(a A 7 8 9 10 J Q K)) (< (best-total my-hand) 17)) #t) ((and (member? upcard '(2 3 4 5 6)) (< (best-total my-hand) 12)) #t) (else #f)))

; part 5
(define (stop-at n)
  (lambda (my-hand upcard) (< (best-total my-hand) n)))

; part 6
(define (valentine my-hand card)
  (if (member? 'H (every last my-hand))
    ((stop-at 19) my-hand card)
    ((stop-at 17) my-hand card)))
    
(play-n valentine 10)
(play-n dealer-sensitive 4)
(play-n (stop-at 17) 4)
(play-n (stop-at 19) 4)
(play-n stop-at-17 4)
