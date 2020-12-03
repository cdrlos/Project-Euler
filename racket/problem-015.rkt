#|
Lattice paths
Problem 15
|#

#lang typed/racket


(define (partial-factorial [start : Integer] [stop : Integer]) : Integer
  (let loop ((i start)
             (p 1))
    (if (> i stop)
        p
        (loop (+ i 1) (* i p)))))

(define (square-grid-walks [n : Integer]) : Integer
  (quotient (partial-factorial (+ n 1) (* 2 n)) (partial-factorial 1 n)))

(define answer : Integer
  (square-grid-walks 20))

(module+ main
  (display (format "Answer: ~a~%" answer)))
