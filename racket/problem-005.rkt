#|
Smallest multiple

Problem 5
|#

#lang typed/racket

(: answer Integer)
(define answer
  (foldl lcm 1 (range 2 21)))

(module+ main
  (display (format "Answer: ~a~%" answer)))
