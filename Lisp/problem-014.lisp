#|
Longest Collatz sequence
Problem 14

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
|#


(defun collatz-chain-length (n)
  (loop for ))

;; (define (collatz-chain-length n)
;;   (let loop ((c 1)
;;              (m n))
;;     (cond ((= m 1) c)
;;           ((even? m) (loop (+ c 1) (/ m 2)))
;;           (else (loop (+ c 1) (+ 1 (* 3 m)))))))

;; (define answer-014
;;   (let loop ((i 1)
;;              (longest-chain-length-so-far 1)
;;              (starting-number-with-longest-chain 1))
;;     (if (> i 1000000)
;;         starting-number-with-longest-chain
;;         (let ((current-chain-length (collatz-chain-length i)))
;;           (if (> current-chain-length longest-chain-length-so-far)
;;               (loop (+ i 1) current-chain-length i)
;;               (loop (+ i 1)
;;                     longest-chain-length-so-far
;;                     starting-number-with-longest-chain))))))

;; (define (main)
;;   (display (format "Problem 14 answer: ~a~%" answer-014)))

;; (main)
