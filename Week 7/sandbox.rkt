#lang racket

(define x 3)
(define y (+ x 2))

(define pow ; function
  (lambda (x y)
    (if (= y 0)
        1
        (* x (pow x (- y 1))))))

(define (fibo x)
  (cond [(< x 1) 0]
        [(= x 1) 1]
        [(+ (fibo (- x 1)) (fibo (- x 2)))]))

(println (fibo 11))

(define a 4)
(println a)
(set! a 21)
(println a)