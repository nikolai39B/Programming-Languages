#lang racket

(define (5th-power n)
  (* n n n n n))

; car cdr
(define (odd-list L)
  (if (null? L)
      '()
      (cons (car L) (if (null? (cdr L))
                        '()
                        (odd-list (cdr (cdr L)))))))


(define (even-list L)
  (if (or (null? L) (null? (cdr L)))
      '()
      (cons (car (cdr L)) (if (null? (cdr L))
                              '()
                              (even-list (cdr (cdr L)))))))

(define (sequencer low high stride)
  (cons low (if (> (+ low stride) high)
                '()
                (sequencer (+ low stride) high stride))))

(define (duplicator L)
  (if (null? L)
      '()
      (if (list? (car L))
          (cons (duplicator (car L)) (duplicator (cdr L)))
          (append (cons (car L) (list (car L))) (duplicator (cdr L))))))