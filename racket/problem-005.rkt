#|
Smallest multiple

Problem 5
|#

#lang typed/racket

(: answer-005 Integer)
(define answer-005
  (foldl lcm 1 (range 2 21)))

(define (main)
  (display (format "Problem 5 answer: ~a~%" answer-005)))

(main)
