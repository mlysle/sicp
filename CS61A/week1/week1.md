# Week 1

## Homework

Will fill out later.

### Question 1

### Question 2

## First Lab

> I do not use emacs or scheme so I skipped these exercises.

## Second Lab

### Plurals

> See `plural.rkt`:
>
> ```scheme
> ; check if last letter is y and the preceding letter is not a vowel (i.e. a consonant)
> (define (uses-ies-ending? wd)
>   (and (equal? (last wd) 'y)
>        (not (member? (last (butlast wd))
>                      '(a e i o u)))))
>
> (define (plural wd)
>   (if (uses-ies-ending? wd)
>       (word (butlast wd) 'ies)
>       (word wd 's)))
> ```

### Sum of Larger Squares

> See `ex-1.3.rkt`:
>
> ```scheme
> (define (square a) (* a a))
>
> (define (sum_of_squares a b) (+ (square a) (square b)))
>
> (define (sum_of_larger_squares x y z)
>   (cond ((and (> x z) (> y z)) (sum_of_squares x y))
>        ((and (> x y) (> z y)) (sum_of_squares x z))
>        (else (sum_of_squares y z))))
> ```

### Removing Duplicates

> See `dupls-removed.rkt`:
>
> ```scheme
> (define (dupl-word words)
>   (if (member? (first words) (butfirst words))
>       '()
>        (first words)))
>
> (define (dupls-removed words)
>   (if (empty? words)
>     '()
>     (sentence (dupl-word words) (dupls-removed (butfirst words)))))
> ```
