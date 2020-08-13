;;; Problem 16 solution

(cond-expand
  (chicken-4 '())
  (chicken-5 (import (chicken format)))
  (guile '()))

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
