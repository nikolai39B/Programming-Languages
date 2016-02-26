;
;   Assignment 4 Tests
;
;   Authors: John Mikolay and Will Hauber
;   Date: 02/25/16
;

#lang racket

(require "Mikolay_Hauber_hw4.rkt")

(println "5th-power")
(println (equal? (5th-power 0) 0))
(println (equal? (5th-power 2) 32))
(println (equal? (5th-power 3) 243))

(println "odd-list")
(println (equal? (odd-list '()) '()))
(println (equal? (odd-list '(1)) '(1)))
(println (equal? (odd-list '(1 2)) '(1)))
(println (equal? (odd-list '(1 2 3 4 5 6)) '(1 3 5)))
         

(println "even-list")
(println (equal? (even-list '()) '()))
(println (equal? (even-list '(1)) '()))
(println (equal? (even-list '(1 2)) '(2)))
(println (equal? (even-list '(1 2 3 4 5 6)) '(2 4 6)))

(println "sequencer")
(println (equal? (sequencer 3 2 1) '())) 
(println (equal? (sequencer 3 8 3) '(3 6))) 
(println (equal? (sequencer 3 11 2) '(3 5 7 9 11)))

(println "duplicator")
(println (equal? (duplicator '()) '()))
(println (equal? (duplicator '(a 1 b 2 c 3)) '(a a 1 1 b b 2 2 c c 3 3)))
(println (equal? (duplicator  '((a 1) b ((c)) 2)) '((a a 1 1) b b ((c c)) 2 2)))

(println "dotProduct")
(println (equal? (dotProduct '() '()) 0))
(println (equal? (dotProduct '() '(1)) "*incompatible*"))
(println (equal? (dotProduct '(1 2) '(3 4)) 11))
(println (equal? (dotProduct '(1 2 3) '(4 5 6)) 32))
(println (equal? (dotProduct '(1 2 3) '(4 5)) "*incompatible*"))

(println "string-append-map")
(println (equal? (string-append-map '() "") '()))
(println (equal? (string-append-map '("a") "") '("a")))
(println (equal? (string-append-map '() "a") '()))
(println (equal? (string-append-map '("a" "b" "c") "def") '("adef" "bdef" "cdef")))

(println "list-nth-mod")
(println (equal? (list-nth-mod '("apple") 27) "apple"))
(println (equal? (list-nth-mod '(1 2 3 4) 0) 1))
(println (equal? (list-nth-mod '(1 2 3 4) 2) 3))
(println (equal? (list-nth-mod '(1 2 3 4) 7) 4))
(println (with-handlers ([exn:fail? (lambda(exn) #t)]) (list-nth-mod '(1) -1)))
(println (with-handlers ([exn:fail? (lambda(exn) #t)]) (list-nth-mod '() 1)))

(println "stream-for-n-steps")
(println (equal? (stream-for-n-steps powers-of-two 0) '()))
(println (equal? (stream-for-n-steps powers-of-two 3) '(2 4 8)))
(println (equal? (stream-for-n-steps powers-of-two 5) '(2 4 8 16 32)))

(println "funny-number-stream")
(println (equal? (stream-for-n-steps funny-number-stream 1) '(1)))
(println (equal? (stream-for-n-steps funny-number-stream 5) '(1 2 3 4 -5)))
(println (equal? (stream-for-n-steps funny-number-stream 12) '(1 2 3 4 -5 6 7 8 9 -10 11 12)))

(println "cycle-lists")
(println (equal? (stream-for-n-steps (cycle-lists  '(1 2 3) '("a" "b")) 0) '()))
(println (equal? (stream-for-n-steps (cycle-lists  '(1 2 3) '("a" "b")) 2) '((1 "a") (2 "b"))))
(println (equal? (stream-for-n-steps (cycle-lists  '(1 2 3) '("a" "b")) 10)
                 '((1 "a") (2 "b") (3 "a") (1 "b") (2 "a") (3 "b") (1 "a") (2 "b") (3 "a") (1 "b"))))
(println (equal? (stream-for-n-steps (cycle-lists  '(1) '("a")) 3) '((1 "a") (1 "a") (1 "a"))))