;;Problem 3

(import (chezscheme))

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
  (display (format #t "SOLUTION: ~a~%" answer-003)))

(main)

;; SOLUTION: 6857
