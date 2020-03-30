#|
Problem 1
|#

(defun dividesp (m n)
  (zerop (mod m n)))

(defvar answer-001
  (loop for i from 1 to 1000 when (or (dividesp i 3) (dividesp i 5)) sum i))

(defun main ()
  (format t "Answer: ~a~%" answer-001))

(main)

;; Answer: 234168
