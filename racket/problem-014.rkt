#|
Longest Collatz sequence
Problem 14
|#

#lang typed/racket

(define (collatz-chain-length [n : Integer]) : Integer
  (let loop ([c 1]
             [m n])
    (cond [(= m 1) c]
          [(even? m) (loop (+ c 1) (quotient m 2))]
          [else (loop (+ c 1) (+ 1 (* 3 m)))])))

(define answer-014 : Integer
  (let loop ([i : Integer 1]
             [longest-chain-length-so-far : Integer 1]
             [starting-number-with-longest-chain : Integer 1])
    (if (> i 1000000)
        starting-number-with-longest-chain
        (let ((current-chain-length (collatz-chain-length i)))
          (if (> current-chain-length longest-chain-length-so-far)
              (loop (+ i 1) current-chain-length i)
              (loop (+ i 1)
                    longest-chain-length-so-far
                    starting-number-with-longest-chain))))))

(define (main) : Void
  (display (format "Problem 14 answer: ~a~%" answer-014)))

(main)
