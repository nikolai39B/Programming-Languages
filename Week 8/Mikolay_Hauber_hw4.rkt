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

(define (string-append-map xs suffix)
  (map
    ; For each item in xs, append the suffix
    (lambda (input)
      (string-append input suffix)
    )
    xs
  )
)
       
(define (list-nth-mod xs n)
  (cond
    ; If n is less than 0, flag an error
    [
      (< n 0)
      (error "list-nth-mod: negative number")
    ]
    
    ; Otherwise, if xs is empty, flag an error
    [
      (null? xs)
      (error "list-nth-mod: empty list")
    ]

    ; Otherwise, find the result
    [
      #t

      ; Return the element in the list equal to the remainder when we divide n by the length of xs
      (list-ref
        xs
        (modulo
          n
          (length xs)
        )
      )
    ]
  )
)

(define (stream-for-n-steps s n)
  ; If n is 0 or less ...
  (if
    (<= n 0)

    ; ... return an empty list
    '()

    ; Otherwise, get the next value in the stream
    (cons
      ; Append the next value to the result
      (car (s))

      ; Recurse on the stream
      (stream-for-n-steps
        (cdr (s))
        (- n 1)
      )
    )
  )
)

(define powers-of-two
  (letrec
    (
      [
        f (lambda (x)
          (cons
            x
            (lambda ()
              (f
                (* x 2)
              )
            )
          )
        )
      ]
    )
    
    (lambda ()
      (f 2)
    )
  )
)

(define funny-number-stream
  (letrec
    (
      ; Define our main function for the stream
      [
        getNextPair (lambda (currValue)
          ; Prepend the current value to the next stream
          (cons
            ; Prepend the current value
            currValue

            ; Define the next stream
            (lambda ()
              (getNextPair
                (cond                  
                  ; If currValue is negative, return the absolute value of currValue, + 1
                  [
                    (< currValue 0)
                    (+
                      (abs currValue)
                      1
                    )
                  ]

                  ; Otherwise, if currValue + 1 is divisible by 5, return it negated
                  [
                    (=
                      (modulo
                        (+ currValue 1)
                        5
                      )
                      0
                    )                
                    (*
                      (+ currValue 1)
                      -1
                    )
                  ]

                  ; Otherwise, return currValue + 1
                  [
                    #t
                    (+ currValue 1)
                  ]
                )
              )
            )
          )
        )
      ]
    )
    
    ; Define the intial value
    (lambda ()
      (getNextPair 1)
    )
  )  
)


(define (createStreamWithValueModifier initialValue getNextValueFromCurrent modifyValue)
  (letrec
    (
      ; Define our main function for the stream
      [
        getNextPair (lambda (currValue)
          ; Prepend the current value to the next stream
          (cons
            ; Modify and prepend the current value
            (modifyValue currValue)

            ; Define the next stream
            (lambda ()
              (getNextPair
                (getNextValueFromCurrent currValue)
              )
            )
          )
        )
      ]
    )
    
    ; Define the intial value
    (lambda ()
      (getNextPair initialValue)
    )
  ) 
)

(define (createStream initialValue getNextValueFromCurrent)
  (createStreamWithValueModifier
    initialValue
    getNextValueFromCurrent
    (lambda (currValue)
      currValue
    )
  )
)

(define (cycle-lists xs ys)
  ; Define the new stream
  (createStreamWithValueModifier
    ; Our initial value is 0 (index 0)
    0

    ; The next index in the stream is the current index + 1
    (lambda (currIndex)
      (+ currIndex 1)
    )

    ; We don't actually want to output the index; instead, we want to give the elements at that index
    (lambda (currIndex)
      (list
        (list-nth-mod xs currIndex)
        (list-nth-mod ys currIndex)
      )
    )
  )
)


