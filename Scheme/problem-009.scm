#|
Special Pythagorean triplet
Problem 9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
|#

(import (chicken format))

(define (pythagorean? a b c)
  (= (+ (* a a)
        (* b b))
     (* c c)))

(define (triplets-with-perimeter= p)
  (define (helper a b ts)
    (let ((c (- p a b)))
      (cond ((> (+ (* 3 a) 2) p) ts)
            ((<= c b) (helper (+ a 1) (+ a 2) ts))
            (else (helper a (+ b 1) (cons (list a b c) ts))))))
  (helper 1 2 '()))

(define answer-009
  (map (lambda (xs) (reduce * 1 xs))
       (filter (lambda (xs) (apply pythagorean? xs))
               (triplets-with-perimeter= 1000))))

(define (main)
  (display (format "Problem 9 answer: ~a~%" answer-009)))

(main)
