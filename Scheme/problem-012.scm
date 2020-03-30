#|
Highly divisible triangular number
Problem 12

The sequence of triangle numbers is generated by adding the natural numbers. So
the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten
terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

1: 1
3: 1,3
6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred
divisors?
|#

(import (chicken format))

(define (triangular n)
  (/ (* n (+ n 1)) 2))

(define (divides? m n)
  (zero? (remainder m n)))

(define (number-of-divisors n)
  (let loop ((i 1)
             (d 0))
    (cond ((> (* i i) n) d)
          ((divides? n i) (if (= i (/ n i))
                              (loop (+ i 1) (+ d 1))
                              (loop (+ i 1) (+ d 2))))
          (else (loop (+ i 1) d)))))

(define answer-012
  (let loop ((i 1)
             (answer (triangular 0)))
    (if (> (number-of-divisors answer) 500)
        answer
        (loop (+ i 1) (triangular i)))))

(define (main)
  (display (format "Problem 12 answer: ~a~%" answer-012)))

(main)
