#|
Power digit sum
Problem 16

215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
|#

;; (import (chicken format))
(use-modules (ice-9 format))

(define (sum-of-digits n)
  (let loop ((m n)
             (s 0))
    (if (= m 0)
        s
        (let ((r (remainder m 10))
              (q (quotient m 10)))
          (loop q (+ s r))))))

(define answer-016
  (sum-of-digits (expt 2 1000)))

(define (main)
  (display (format #t "Problem 16 answer: ~a~%" answer-016)))

(main)
