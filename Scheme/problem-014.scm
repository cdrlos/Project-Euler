#|
Problem 14
|#

(import (chicken format))

(define (collatz-chain-length n)
  (let loop ((c 1)
             (m n))
    (cond ((= m 1) c)
          ((even? m) (loop (+ c 1) (/ m 2)))
          (else (loop (+ c 1) (+ 1 (* 3 m)))))))

(define answer-014
  (let loop ((i 1)
             (longest-chain-length-so-far 1)
             (starting-number-with-longest-chain 1))
    (if (> i 1000000)
        starting-number-with-longest-chain
        (let ((current-chain-length (collatz-chain-length i)))
          (if (> current-chain-length longest-chain-length-so-far)
              (loop (+ i 1) current-chain-length i)
              (loop (+ i 1)
                    longest-chain-length-so-far
                    starting-number-with-longest-chain))))))

(define (main)
  (display (format #t "Problem 14 answer: ~a~%" answer-014)))

(main)
