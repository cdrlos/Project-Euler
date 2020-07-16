#|
10001st prime
Problem 7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
|#

(import (chicken format))

;; Naive prime-number predicate
(define (prime? n)
  (cond ((<= n 1) #f)
        ((= n 2) #t)
        (else
         (let loop ((i 2))
           (cond ((zero? (remainder n i)) #f)
                 ((> (* i i) n) #t)
                 (else (loop (+ i 1))))))))

;; Slow prime number generator
(define (prime n)
  (define (helper n p)
    (if (zero? n)
        p
        (let loop ((i (+ p 1)))
          (if (prime? i)
              (helper (- n 1) i)
              (loop (+ i 1))))))
  (helper n 1))

(define answer-007
  (prime 10001))

(define (main)
  (display (format "Problem 7 answer: ~a~%" answer-007)))

(main)
