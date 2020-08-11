;;; Problem 15 solution

(use-modules (ice-9 format))

(define (partial-factorial start stop)
  (let loop ((i start)
             (p 1))
    (if (> i stop)
        p
        (loop (+ i 1) (* i p)))))

(define (square-grid-walks n)
  (/ (partial-factorial (+ n 1) (* 2 n)) (partial-factorial 1 n)))

(define answer-015
  (square-grid-walks 20))

(define (main)
  (display (format "Problem 15 answer: ~a~%" answer-015)))

(main)
