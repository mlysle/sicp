# Week 1

## Homework

### Question 1

> See `ex-1.3.rkt`:
>
> Since Alyssa has redefined if as an ordinary procedure, the interpreter will evaluate it under applicative order rules.
> When the interpreter gets to `(new-if (good-enough? guess x))` it will first evaluate the operands. The operand `(good-enough? guess x)` will evaluate to true or false, and the operand `guess` will evaluate to itself. However, the third argument `(sqrt-iter (improve guess x) x))`, will cause an infinite loop until the interpreter runs out of memory.

### Question 2

> See 'squares.rkt':
>
> ```scheme
> (define (square x) (* x x))
>
> (define (squares numbersentence)
>   (if (empty? numbersentence)
>     '()
>     (sentence (square (first numbersentence))
>               (squares (butfirst numbersentence)))))
> ```

### Question 3

> See 'switch.rkt':
>
> ```scheme
> ; handles the sentence after the first word
> (define (switch_sentence switchme)
>   (define (substitute nextword)
>     (cond ((member? nextword '(i I me Me)) 'you)
>           ((equal? nextword 'you) 'me)
>           (else nextword)))
>   (if (empty? switchme)
>     '()
>     (sentence (substitute (first switchme)) (switch_sentence (butfirst switchme)))))
>
> ; handles the first word, then passes the rest of the sentence to switch_sentence
> (define (switch switchtext)
>   (if (empty? switchtext)
>      '()
>      (if (member? (first switchtext) '(you You))
>       (sentence 'I (switch_sentence (butfirst switchtext)))
>       (sentence (first switchtext) (switch_sentence (butfirst switchtext))))))
> ```

### Question 4

> See 'ordered.rkt':
>
> ```scheme
> (define (ordered? numbers)
>
>   (if (empty? numbers) '(A sentence of numbers is required.)
>     (ascending? numbers)))
>
> (define (ascending? numbers)
>   (cond ((empty? (butfirst numbers)) #t) ; a sentence of one number is always ordered
>         ((< (first numbers) (first (butfirst numbers))) (ascending? (butfirst numbers)))
>         (else #f)))
> ```

### Question 5

> See 'ends-e.rkt':

> ```scheme
> (define (ends-e words)
>   (cond ((empty? words) '())
>         ((equal? (last (first words)) 'e) (sentence (first words) (ends-e (butfirst words))))
>         (else (sentence (ends-e (butfirst words))))))
>
> (ends-e '(please put the salami above the blue elephant))
> ```

### Question 6

> See 'specialforms.rkt':

> ```scheme
> (define (infinite_loop) (infinite_loop))
> (define x 0)
>
> ; these expressions demonstate how 'or and 'and' are special forms
> (if (or (= x 0) (infinite_loop)) ; infinite_loop never evaluated because first condition is true
>   #t
>   #f)
> (if (and (= x 1) (infinite_loop)) ; infinite_loop never evaluated because first condition is false
>   #t
>   #f)
> ```
>
> Treating `or` as a special form is more computationally efficient. Treating `or` as an ordinary procedure could be useful if the evaluation of an argument affected the evaluation of another.

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

```

```
