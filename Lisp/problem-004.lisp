#|
Largest palindrome product
Problem 4
|#

(defun quotient (n m)
  (multiple-value-bind (q r) (floor n m) q))

(defun remainder (n m)
  (multiple-value-bind (q r) (floor n m) r))

(defun digit-to-list (d)
  (do* ((num d (quotient num 10))
        (digits (list (rem num 10)) (cons (rem num 10) digits)))
       ((= (quotient num 10) 0) digits)))

(defun number-range (&key (start 0) end)
  (do* ((n (1+ end) (1- n))
        (range '() (cons n range)))
       ((= n start) range)))

(defvar products-of-three-digits
  (do ((three-digits
        (number-range :start 100 :end 999))
       (cdr three-digits))
      ()
    ))

(number-range :end 10)

(digit-to-list 30902034294)
