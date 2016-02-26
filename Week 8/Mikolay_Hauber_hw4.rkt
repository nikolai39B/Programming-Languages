;
;   Assignment 4
;
;   Authors: John Mikolay and Will Hauber
;   Date: 02/25/16
;

#lang racket
(provide (all-defined-out))

(define (5th-power n)
  ; Return n multiplied by itself 5 times
  (* n n n n n)
)

(define (odd-list L)
  ; If our list is empty ...
  (if
    (null? L)
    ; ... return an empty list
    '()

    ; Otherwise, prepend the front of this list to our result and attempt to recurse
    (cons
      ; Get the head of the list
      (car L)

      ; If the tail of this list is empty ...
      (if
        (null?
          (cdr L)
        )
        ; ... we've hit the effective end of the list, so don't recurse
        '()

        ; Otherwise, recurse on the list after removing the first two items
        (odd-list
          (cdr
            (cdr L)
          )
        )
      )
    )
  )
)


(define (even-list L)
  ; If our list is empty or contains only one element ...
  (if
    (or
      (null? L)
      (null?
        (cdr L)
      )
    )

    ; ... return an empty list
    '()

    ; Otherwise, prepend the second element of this list to our result and attempt to recurse
    (cons
      ; Get the second item in the list
      (car
        (cdr L)
      )

      ; Recurse on the list after removing the first two items
      (even-list
        (cdr
          (cdr L)
        )
      )
    )
  )
)

(define (sequencer low high stride)
  ; If low is greater than high ...
  (if
    (> low high)

    ; ... return an empty list
    '()

    ; Otherwise, prepend low to our result and recurse
    (cons

      ; Prepend the low value
      low

      ; Recurse, but with low equal to low + stride
      (sequencer
        (+ low stride)
        high
        stride
      )
    )
  )
)
    
  


(define (duplicator L)
  ; If our list is empty ...
  (if
    (null? L)

    ; ... return an empty list
    '()

    ; Otherwise, if the head of our list is a list ...
    (if
      (list?
        (car L)
      )

      ; ... recurse on the both the head and tail of the list and concatenate the results
      (cons
        ; Recurse on the head of the list
        (duplicator
          (car L)
        )

        ; Recurse on the tail of the list
        (duplicator
          (cdr L)
        )
      )

      ; Otherwise, duplicate the head of our list and prepend it to the result
      (append
        ; Duplicate the head and turn it into a list
        (cons
          (car L)

          (list
            (car L)
           )
         )

        ; Recurse on the tail of our list
        (duplicator
          (cdr L)
        )
      )
    )
  )
)

(define (dotProduct list1 list2)
  ; If the lengths of the two lists are not equal ...
  (if
    (not 
      (=
        (length list1)
        (length list2)
      )
    )

    ; ... return '*incompatible*'
    "*incompatible*"

    ; Otherwise, if the list length is 0 ...
    (if
      (=
        (length list1)
        0
      )
      
      ; ... return 0
      0

      ; Otherwise, compute the first term and recurse
      (+
        ; Multiply the first two terms
        (*
          (car list1)
          (car list2)
        )

        ; Add them to the result
        (dotProduct
          (cdr list1)
          (cdr list2)
        )
      )
    )
  )
)
       
