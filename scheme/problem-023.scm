;;; Problem 23

(cond-expand
  (chicken-4 '())
  (chicken-5 (import (chicken format)))
  (guile '()))

(define (is-abundant? n)
  (let loop ((i 1)
             (count 0))
    (cond ((> (* i 2) n) (> count n))
          ((zero? (remainder n i)) (loop (+ i 1) (+ count i)))
          (else (loop (+ i 1) count)))))

(define (abundant-numbers< n)
  (let loop ((i 1)
             (abund '()))
    (cond ((> i n) abund)
          ((is-abundant? i) (loop (+ i 1) (cons i abund)))
          (else (loop (+ i 1) abund)))))

(define (sum-of-abundant< n)
  (let loop ((xs (abundant-numbers< n))
             (ys '()))
    (if (null? xs)
        ys
        (let ((xx (car xs))
              (xss (cdr xs)))
          (loop xss (append ys (map (lambda (z) (+ xx z)) xs)))))))

(define answer-023
  (let ((abd (sum-of-abundant< (quotient 28123 2))))
    (fold (lambda (x y) (- x y)) (* 28123 14062) abd)))

(define (main)
  (display (format "Problem 23 answer: ~a~%" answer-023)))

(main)
