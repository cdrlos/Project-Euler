#|
Even Fibonacci numbers
Problem 2
|#
;; Answer: 4613732

#lang typed/racket

(: fibonacci-numbers< (-> Integer (Listof Integer)))
(define (fibonacci-numbers< n)
  (let loop ([f1 1] [f2 1] [acc : (Listof Integer) '()])
    (let ([f3 (+ f1 f2)])
      (if (> f3 n)
          acc
          (loop f2 f3 (cons f3 acc))))))

(: even-fibonacci-numbers< (-> Integer (Listof Integer)))
(define (even-fibonacci-numbers< n)
  (filter even? (fibonacci-numbers< n)))

(: answer-002 Integer)
(define answer-002
  (foldl + 0 (even-fibonacci-numbers< 4000000)))

(define (main)
  (display (format "Problem 2 answer: ~a~%" answer-002)))

(main)
