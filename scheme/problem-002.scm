;; Problem 2

(import (chezscheme))

(define (fibonacci-numbers< n)
  (define (fib-tail fibn-2 fibn-1 fib-lst)
    (if (> (+ fibn-2 fibn-1) n)
        fib-lst
        (fib-tail fibn-1
                  (+ fibn-1 fibn-2)
                  (cons (+ fibn-1 fibn-2) fib-lst))))
  (fib-tail 1 1 '()))

(define (even-fibonacci-numbers< n)
  (filter even? (fibonacci-numbers< n)))

(define (sum lst)
  (fold-right + 0 lst))

(define answer-002
  (sum (even-fibonacci-numbers< 4000000)))

(define (main)
  (display (format #t "SOLUTION: ~a~%" answer-002)))

(main)

;; SOLUTION: 4613732
