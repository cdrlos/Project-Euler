#|
Power digit sum
Problem 16
|#

#lang typed/racket

(define (sum-of-digits [n : Integer]) : Integer
  (let loop ([m n] [s 0])
    (if (= m 0)
        s
        (let ([r (remainder m 10)] [q (quotient m 10)])
          (loop q (+ s r))))))

(define answer-016 : Integer
  (sum-of-digits (expt 2 1000)))

(define (main)
  (display (format "Problem 16 answer: ~a~%" answer-016)))

(main)
