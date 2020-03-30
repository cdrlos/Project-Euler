#|
Largest prime factor
Problem 3
|#
;; Answer: 6857

#lang typed/racket

(: divides? (-> Integer Integer Boolean))
(define (divides? n m)
  (zero? (remainder n m)))

(: largest-prime-factor (-> Integer Integer))
(define (largest-prime-factor n)
  (let loop ([m n] [l 2])
    (cond ((= m 1) l)
          ((divides? m l) (loop (quotient m l) l))
          (else (loop m (+ l 1))))))

(: answer-003 Integer)
(define answer-003 (largest-prime-factor 600851475143))

(define (main)
  (display (format "Problem 4 answer: ~a~%" answer-003)))

(main)
