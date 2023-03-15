#lang sicp

; the only way changing the order could affect the result is if both cases are met
; in other words if the amount is 0 and there are zero kinds of coins.

; could this happen? if you run (cc 0) on both versions of the procedure you will get differing outputs.
; but the count-change amount assumes 5 denominations from the start
; and it won't ever try to sort zero dollars with zero kinds
; so changing the order will not change the output
