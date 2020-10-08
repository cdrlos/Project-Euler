;; Problem 4

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

(define (products lst)
  (define (prods-rec lst1 lst2)
    (if (null? lst1)
        lst2
        (prods-rec (cdr lst1)
                   (append
                    (map (lambda (x) (* (car lst1) x))
                         (cdr lst1))
                    lst2))))
  (prods-rec lst '()))

(define (palindrome? num)
  (define (palindrome?-rec num rev tmp)
    (if (zero? tmp)
        rev
        (palindrome?-rec num
                         (+ (* 10 rev) (remainder tmp 10))
                         (quotient tmp 10))))
  (= (palindrome?-rec num 0 num) num))

(define answer-004
  (fold-left max 1 (filter palindrome? (products (range 100 999)))))

(define (main)
  (display (format "SOLUTION: ~a~%" answer-004)))

(main)

;; SOLUTION: 906609
