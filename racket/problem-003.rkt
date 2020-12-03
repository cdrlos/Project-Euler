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

(: answer Integer)
(define answer (largest-prime-factor 600851475143))


(module+ main
  (display (format "Answer: ~a~%" answer)))
