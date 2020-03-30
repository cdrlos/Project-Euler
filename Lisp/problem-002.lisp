#|
Even Fibonacci numbers
Problem 2
|#

(defun fibonacci<= (n)
  (do ((i 0 (1+ i))
       (fib1 0 fib2)
       (fib2 1 (+ fib1 fib2))
       (fibs '() (cons fib2 fibs)))
      ((>= fib2 n) fibs)))


(defun fibonacci (n &aux (f0 0) (f1 1))
  (case n
    (0 f0)
    (1 f1)
    (t (loop for n from 2 to n
             for a = f0 then b and b = f1 then result
             for result = (+ a b)
             finally (return result)))))

(defvar answer-002
  (reduce #'+ (remove-if-not #'evenp (fibonacci<= 4000000))))

(defun main ()
  (format t "Answer: ~a~%" answer-002))

(main)

;; Answer: 4613732
