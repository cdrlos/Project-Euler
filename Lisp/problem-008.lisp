#|
Largest product in a series
Problem 8
|#

(defun product-of-digits (d)
  (do* ((prod 1 (* prod (mod i 10)))
        (i d (/ (- i (mod i 10)) 10)))
       ((= i 0) prod)))

(defun take-n-digits (d n &optional (start 0))
  (mod (/
        (- d (mod d (expt 10 start)))
        (expt 10 start))
       (expt 10 n)))

(defun solve-euler-8 (d n)
  (do* ((prods '() (cons (product-of-digits digs) prods))
        (digs (take-n-digits d n) (take-n-digits k n))
        (k d (floor k 10)))
       ((= k 0) (apply #'max prods))))
