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

(: answer Integer)
(define answer
  (foldl + 0 (even-fibonacci-numbers< 4000000)))

(module+ main
  (display (format "Answer: ~a~%" answer)))
