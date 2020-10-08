#|
10001st prime

Problem 7
|#

#lang typed/racket

(: prime? (-> Integer Boolean))
(define (prime? n)
  (cond [(<= n 1) #f]
        [(= n 2) #t]
        [else
         (let loop ((i 2))
           (cond ((zero? (remainder n i)) #f)
                 ((> (* i i) n) #t)
                 (else (loop (+ i 1)))))]))

(: prime (-> Integer Integer))
(define (prime n)
  (: helper (-> Integer Integer Integer))
  (define (helper n p)
    (if (zero? n)
        p
        (let loop ([i (+ p 1)])
          (if (prime? i)
              (helper (- n 1) i)
              (loop (+ i 1))))))
  (helper n 1))

(: answer-007 Integer)
(define answer-007
  (prime 10001))

(define (main)
  (display (format "Problem 7 answer: ~a~%" answer-007)))

(main)
