;; Problem 6

(import (chezscheme))

(define (square x)
  (* x x))

(define (series>= f n)
  (let loop [(i 0)
             (acc 0)]
    (if (> i n)
        acc
        (loop (+ i 1)
              (+ acc (f i))))))

(define answer-006
  (- (square (series>= (lambda (x) x) 100))
     (series>= (lambda (x) (* x x)) 100)))

(define (main)
  (display (format "SOLUTION: ~a~%" answer-006)))

(main)

;; SOLUTION: 25164150
