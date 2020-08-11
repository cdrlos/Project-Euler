#|
Problem 3:

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
|#
;; Answer: 6857

(use-modules (ice-9 format)
             (ice-9 match))

(define (divides? n m)
  (zero? (remainder n m)))

(define (largest-prime-factor n)
  (define (lpf-tail n l)
    (cond ((= n 1) l)
          ((divides? n l) (lpf-tail (/ n l) l))
          (else (lpf-tail n (+ l 1)))))
  (lpf-tail n 2))

(define answer-003 (largest-prime-factor 600851475143))

(define (main)
  (display (format #t "Problem 3 answer: ~a~%" answer-003)))

(main)
