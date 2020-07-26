#|
Project Euler Problem 1:

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get
3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
|#
;; Answer: 233168

(import srfi-1 matchable)

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
  (fold + 0 (filter (lambda (n) (or (zero? (remainder n 3))
                                    (zero? (remainder n 5))))
                     (range 1000))))

(define (main)
  (display (format "Problem 1 answer: ~a~%" answer-001)))

(main)
