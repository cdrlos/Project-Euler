#|
Multiples of 3 and 5
Problem 1
|#
;; Answer: 234168

#lang typed/racket

(define answer : Integer
  (foldl + 0 (filter (lambda ([n : Integer]) (or (zero? (remainder n 3))
                                                 (zero? (remainder n 5))))
                     (range 1000))))

(module+ main
  (display (format "Answer: ~a~%" answer)))
