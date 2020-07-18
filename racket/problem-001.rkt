#|
Multiples of 3 and 5
Problem 1
|#
;; Answer: 234168

#lang typed/racket

(define answer-001 : Integer
  (foldl + 0 (filter (lambda ([n : Integer]) (or (zero? (remainder n 3))
                                                 (zero? (remainder n 5))))
                     (range 1000))))

(define (main)
  (display (format "Problem 1 answer: ~a~%" answer-001)))

(main)
