;; Problem 12

(cond-expand
  (chicken-5 (import (chicken format)))
  (chicken-4 (import format))
  (guile '()))

(define (triangular n)
  (/ (* n (+ n 1)) 2))

(define (divides? m n)
  (zero? (remainder m n)))

(define (number-of-divisors n)
  (let loop ((i 1)
             (d 0))
    (cond ((> (* i i) n) d)
          ((divides? n i) (if (= i (/ n i))
                              (loop (+ i 1) (+ d 1))
                              (loop (+ i 1) (+ d 2))))
          (else (loop (+ i 1) d)))))

(define answer-012
  (let loop ((i 1)
             (answer (triangular 0)))
    (if (> (number-of-divisors answer) 500)
        answer
        (loop (+ i 1) (triangular i)))))

(define (main)
  (display (format "Problem 12 answer: ~a~%" answer-012)))

(main)
