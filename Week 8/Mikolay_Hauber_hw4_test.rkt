;
;   Assignment 4 Tests
;
;   Authors: John Mikolay and Will Hauber
;   Date: 02/25/16
;

#lang racket

(require "Mikolay_Hauber_hw4.rkt")

(println "5th-power")
(println (= (5th-power 0) 0))
(println (= (5th-power 2) 32))
(println (= (5th-power 3) 243))

(println "odd-list")
(println (= (odd-list '()) '()))
(println (= (odd-list '(1)) '(1)))
(println (= (odd-list '(1 2)) '(1)))
(println (= (odd-list '(1 2 3 4 5 6)) '(1 3 5)))
         

(println "even-list")
(println (= (odd-list '()) '()))
(println (= (odd-list '(1)) '()))
(println (= (odd-list '(1 2)) '(2)))
(println (= (odd-list '(1 2 3 4 5 6)) '(2 4 6)))