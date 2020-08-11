;;; Problem 7 solution

(use-modules (ice-9 format))

;; Naive prime-number predicate
(define (prime? n)
  (cond [(<= n 1) #f]
        [(= n 2) #t]
        [else
         (let loop ((i 2))
           (cond ((zero? (remainder n i)) #f)
                 ((> (* i i) n) #t)
                 (else (loop (+ i 1)))))]))

;; Slow prime number generator
(define (prime n)
  (define (helper n p)
    (if (zero? n)
        p
        (let loop ((i (+ p 1)))
          (if (prime? i)
              (helper (- n 1) i)
              (loop (+ i 1))))))
  (helper n 1))

(define answer-007
  (prime 10001))

(define (main)
  (display (format "Problem 7 answer: ~a~%" answer-007)))

(main)
