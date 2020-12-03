#|
Summation of primes

Problem 10
|#

#lang typed/racket

;; From Rosetta code, not my idea
(: sieve (-> Integer (Listof Integer)))
(define (sieve n)
  (: primes (Mutable-Vectorof Boolean))
  (define primes (make-vector (add1 n) #t))
  (for* ([i (in-range 2 (add1 n))]
         #:when (vector-ref primes i)
         [j (in-range (* i i) (add1 n) i)])
    (vector-set! primes j #f))
  (for/list ([n (in-range 2 (add1 n))]
             #:when (vector-ref primes n))
    n))

(: answer Integer)
(define answer-010
  (foldl + 1 (sieve 2000000)))

(module+ main
  (display (format "Answer: ~a~%" answer)))
