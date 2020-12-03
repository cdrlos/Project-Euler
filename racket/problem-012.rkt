#|
Highly divisible triangular number

Problem 12
|#

#lang typed/racket

(: triangular (-> Integer Integer))
(define (triangular n)
  (quotient (* n (+ n 1)) 2))

(: divides? (-> Integer Integer Boolean))
(define (divides? m n)
  (zero? (remainder m n)))

(: number-of-divisors (-> Integer Integer))
(define (number-of-divisors n)
  (let loop ((i 1)
             (d 0))
    (cond ((> (* i i) n) d)
          ((divides? n i) (if (= i (/ n i))
                              (loop (+ i 1) (+ d 1))
                              (loop (+ i 1) (+ d 2))))
          (else (loop (+ i 1) d)))))

(: answer Integer)
(define answer
  (let loop ((i 1)
             (answer (triangular 0)))
    (if (> (number-of-divisors answer) 500)
        answer
        (loop (+ i 1) (triangular i)))))

(module+ main
  (display (format "Answer: ~a~%" answer)))
