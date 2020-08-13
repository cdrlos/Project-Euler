;;; Problem 22 solution

(cond-expand
  (chicken-4 '())
  (chicken-5 (import (chicken format)))
  (guile '()))

(define (score-char char)
  (if (char=? char #\")
      0
      (+ 1 (- (char->integer char)
               (char->integer #\A)))))

(define (score-string str)
  (let ((ip (open-input-string str)))
    (let loop ((score 0)
               (char (read-char ip)))
      (if (eof-object? char)
          score
          (loop (+ score (score-char char)) (read-char ip))))))

(define answer-022
  (let* ((ip (open-input-file "../data/p022_names.txt"))
         (str (read-line ip))
         (sorted-names (sort (string-split str "\",") string<=?)))
    (let loop ((remaining-names sorted-names)
               (cummulative-score 0)
               (name-index 1))
      (if (null? remaining-names)
          cummulative-score
          (loop (cdr remaining-names)
                (+ cummulative-score (* name-index
                                        (score-string (car remaining-names))))
                (+ 1 name-index))))))

(define (main)
  (display (format "Problem 22 answer: ~a~%" answer-022)))

(main)
