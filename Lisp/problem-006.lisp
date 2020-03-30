#|
Sum square difference
Problem 6
|#

(defun solve-problem-6 (n)
  (let ((rng (loop for n from 1 below (1+ n) by 1 collect n))
        (sum-of-squares
          (lambda (lst)
            (reduce #'+
                    (mapcar #'(lambda (x) (* x x))
                            lst))))
        (square-of-sum
          (lambda (lst)
            ((lambda (x) (* x x)) (reduce #'+ lst)))))
    (- (funcall square-of-sum rng)
       (funcall sum-of-squares rng))))
