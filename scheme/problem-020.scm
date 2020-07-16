#|
Factorial digit sum

Problem 20
|#

(import (chicken format) srfi-1)

(define (divides? x y)
  (zero? (remainder x y)))

(define (sum-of-digs-of-factorial n)
  "Thought I could make it more efficient, but this is just shit."
  (define (factorial-w/o-all-the-zeros n)
    (let loop [(i 1) (fact 1)]
      (let [(k (remainder i 10))]
        (cond [(= i n) fact]
              [(zero? k) (loop (+ i 1) (* fact (quotient i 10)))]
              [else (loop (+ i 1) (* fact i))]))))
  (let loop [(fact (factorial-w/o-all-the-zeros n))
             (sum 0)]
    (if (= fact 0)
        sum
        (loop (quotient fact 10) (+ sum (remainder fact 10))))))

(define answer-020
  (sum-of-digs-of-factorial 100))

(define (main)
  (display (format "Problem 20 answer: ~a~%" answer-020)))

(main)
