#|
Sum square difference
Problem 6

The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
|#

(cond-expand
  (chicken-5 (import (chicken format)))
  (chicken-4 (import format))
  (guile '()))

(define (square x)
  (* x x))

(define (series>= f n)
  (let loop [(i 0)
             (acc 0)]
    (if (> i n)
        acc
        (loop (+ i 1)
              (+ acc (f i))))))

(define answer-006
  (- (square (series>= (lambda (x) x) 100))
     (series>= (lambda (x) (* x x)) 100)))

(define (main)
  (display (format "Problem 6 answer: ~a~%" answer-006)))

(main)
