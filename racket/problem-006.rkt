#|
Sum square difference

Problem 6
|#

#lang typed/racket

(: series>= (-> (-> Integer Integer) Integer Integer))
(define (series>= f n)
  (let loop [(i : Integer 0)
             (acc : Integer 0)]
    (if (> i n)
        acc
        (loop (+ i 1)
              (+ acc (f i))))))

(: answer-006 Integer)
(define answer-006
  (- (expt (series>= (lambda (x) x) 100) 2)
     (series>= (lambda (x) (* x x)) 100)))

(define (main)
  (display (format "Problem 6 answer: ~a~%" answer-006)))

(main)
