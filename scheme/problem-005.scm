#|
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
|#

(cond-expand
  (chicken-4 (import matchable))
  (chicken-5 (import (chicken format) matchable))
  (guile (use-modules (ice-9 match))))

(define (range . args)
  (define (range-tail start stop step collect)
    (if (>= start stop)
        (reverse collect)
        (range-tail (+ start step) stop step (cons start collect))))
  (match args
    (()        (range-tail 0 0 1 '()))
    ((x)       (range-tail 0 x 1 '()))
    ((x y)     (range-tail x y 1 '()))
    ((x y z)   (range-tail x y z '()))
    ((x y z l) (range-tail x y z l))))

;; Using the built-in euclidean algorithm is basically cheating
(define (my-gcd m n)
  (define (gcd-tail p q r)
    (if (zero? r )
        q
        (gcd-tail q r (remainder q r))))
  (let ((p (max m n))
        (q (min m n)))
    (gcd-tail p q (remainder p q))))

(define (my-lcm m n)
  (/ (* m n) (my-gcd m n)))

(define answer-005
  (fold my-lcm 1 (range 1 21)))

(define (main)
  (display (format "Problem 5 answer: ~a~%" answer-005)))

(main)
