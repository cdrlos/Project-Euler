;;; Problem 21 solution

(define (divides? x y)
  (zero? (remainder x y)))

(define (amicable-pair x)
  (define (sum-of-divisors n)
    (let loop ((i 1) (sum 0))
      (cond ((>= i n) sum)
            ((divides? n i) (loop (+ i 1) (+ sum i)))
            (else (loop (+ i 1) sum)))))
  (let ((y (sum-of-divisors x)))
    (if (and (not (= x y)) (= x (sum-of-divisors y)))
        (list x y)
        '())))

(define sol
  (let loop ((i 1)
             (amicable-numbers '()))
    (cond ((>= i 10000) (apply + amicable-numbers))
          ((member i amicable-numbers) (loop (+ i 1) amicable-numbers))
          (else (loop (+ i 1)
                      (append amicable-numbers (amicable-pair i)))))))

(define (main)
  (display (format "SOLUTION: ~a~%" sol)))

(main)
