;; Problem 1
(import (chezscheme)
        (matchable))

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

(define answer-001
  (fold-left + 0 (filter (lambda (n) (or (zero? (remainder n 3))
                                    (zero? (remainder n 5))))
                     (range 1000))))

(define (main)
  (display (format #t "SOLUTION: ~a~%" answer-001)))

(main)
;; SOLUTION:
