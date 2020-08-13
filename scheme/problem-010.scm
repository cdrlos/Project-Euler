;;; Problem 10 solution

(cond-expand
  (chicken-4 '())
  (chicken-5 (import (chicken format)))
  (guile '()))

;; From Rosetta code, not my idea
(define (sieve n)
  (define (aux u v)
    (let ((p (car v)))
      (if (> (* p p) n)
          (let rev-append ((u u) (v v))
            (if (null? u) v (rev-append (cdr u) (cons (car u) v))))
          (aux (cons p u)
               (let wheel ((u '()) (v (cdr v)) (a (* p p)))
                 (cond ((null? v) (reverse u))
                       ((= (car v) a) (wheel u (cdr v) (+ a p)))
                       ((> (car v) a) (wheel u v (+ a p)))
                       (else (wheel (cons (car v) u) (cdr v) a))))))))
  (aux '(2)
       (let range ((v '()) (k (if (odd? n) n (- n 1))))
         (if (< k 3) v (range (cons k v) (- k 2))))))

(define answer-010
  (reduce + 1 (sieve 2000000)))

(define (main)
  (display (format "Problem 10 answer: ~a~%" answer-010)))

(main)
