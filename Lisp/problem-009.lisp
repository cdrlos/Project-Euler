#|
Special Pythagorean triplet
Problem 9
|#

(defun square (x)
  (expt x 2))

(defun pythagorean-tripletp (a b c)
  (= (square c)
     (+ (square a) (square b))))
