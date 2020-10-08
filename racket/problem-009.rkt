#|
Special Pythagorean triplet

Problem 9
|#

#lang typed/racket

(: pythagorean? (-> Integer Integer Integer Boolean))
(define (pythagorean? a b c)
  (= (+ (* a a)
        (* b b))
     (* c c)))

(: triplets-with-perimeter= (-> Integer (Listof (Listof Integer))))
(define (triplets-with-perimeter= p)
  (: helper (-> Integer Integer (Listof Integer) (Listof Integer)))
  (define (helper a b ts)
    (let ([c (- p a b)])
      (cond [(> (+ (* 3 a) 2) p) ts]
            [(<= c b) (helper (+ a 1) (+ a 2) ts)]
            [else (helper a (+ b 1) (cons (list a b c) ts))])))
  (helper 1 2 '()))

(: answer-009 (Listof Integer))
(define answer-009
  (map (lambda (xs) (foldl * 1 xs))
       (filter (lambda ([xs : (Listof (Listof Integer))])
                 (apply pythagorean? xs))
               (triplets-with-perimeter= 1000))))

(define (main)
  (display (format "Problem 9 answer: ~a~%" answer-009)))

(main)
