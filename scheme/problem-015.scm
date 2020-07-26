#|
Lattice paths
Problem 15

Starting in the top left corner of a 2×2 grid, and only being able to move to
the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
|#

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
