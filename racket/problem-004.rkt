#|
Largest palindrome product

Problem 4
|#
;; Answer: 906609

#lang typed/racket

(: all-possible-products (-> (Listof Integer) (Listof Integer)))
(define (all-possible-products xs)
  (let loop ([ys : (Listof Integer) xs] [acc : (Listof Integer) '()])
    (if (null? ys)
        acc
        (let ([y : Integer (car ys)] [ys-rst : (Listof Integer) (cdr ys)])
          (loop ys-rst
                (append (map (lambda ([x : Integer]) (* x y)) ys-rst) acc))))))

(: palindrome? (-> Integer Boolean))
(define (palindrome? n)
  (let loop ([rev : Integer 0] [tmp : Integer n])
    (if (zero? tmp)
        (= rev n)
        (loop (+ (* 10 rev) (remainder tmp 10))
              (quotient tmp 10)))))

(: answer Integer)
(define answer
  (foldl max 1 (filter palindrome? (all-possible-products (range 100 999)))))

(module+ main
  (display (format "Answer: ~a~%" answer)))
