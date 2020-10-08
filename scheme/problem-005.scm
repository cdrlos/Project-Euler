;; Problem 5

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
  (fold-left my-lcm 1 (range 1 21)))

(define (main)
  (display (format "SOLUTION: ~a~%" answer-005)))

(main)

;; SOLUTION: 232792560
