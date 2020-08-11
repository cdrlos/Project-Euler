;;; Problem 17 solution

(use-modules (ice-9 format))

(import matchable)

(define (range . args)
  (define (range-tail start stop step collect)
    (if (>= start stop)
        (reverse collect)
        (range-tail (+ start step) stop step (cons start collect))))
  (match args
    (()        (range-tail 0 0 1 '()))
    ((x)       (range-tail 0 x 1 '()))
    ((x y)     (range-tail x y 1 '()))
    ((x y z)   (range-tail x y z '()))
    ((x y z l) (range-tail x y z l))))

(define (number->word n)
  (define (exception q r s)
    (if (zero? r)
        s
        (string-append s "-" (number->word r))))

  (let ((r (remainder n 10))
        (q (quotient n 10))
        (r2 (remainder n 100))
        (q2 (quotient n 100)))
    (cond ((= n 1) "one")
          ((= n 2) "two")
          ((= n 3) "three")
          ((= n 4) "four")
          ((= n 5) "five")
          ((= n 6) "six")
          ((= n 7) "seven")
          ((= n 8) "eight")
          ((= n 9) "nine")
          ((= n 10) "ten")
          ((= n 11) "eleven")
          ((= n 12) "twelve")
          ((= n 13) "thirteen")
          ((= n 15) "fifteen")
          ((= n 18) "eighteen")
          ((and (> n 13) (< n 20))
           (string-append (string-append (number->word (- n 10)) "teen")))
          ((and (>= n 20) (< n 30)) (exception q r "twenty"))
          ((and (>= n 30) (< n 40)) (exception q r "thirty"))
          ((and (>= n 40) (< n 50)) (exception q r "forty"))
          ((and (>= n 50) (< n 60)) (exception q r "fifty"))
          ((and (>= n 80) (< n 90)) (exception q r "eighty"))
          ((and (> n 30) (< n 100))
           (string-append (number->word q) "ty"
                          (if (zero? r)
                              ""
                              (string-append "-" (number->word r)))))
          ((and (>= n 100) (< n 1000))
           (string-append (number->word q2)
                          " " "hundred"
                          (if (zero? r2)
                              ""
                              (string-append " " "and" " "
                                             (number->word r2)))))
          ((= n 1000) "one thousand")
          (else "help!"))))

(define (count-letters str)
  (let ((ip (open-input-string str)))
    (let loop ((c (read-char ip))
               (i 0))
      (cond ((eof-object? c) i)
            ((or (char=? c #\space)
                 (char=? c #\-))
             (loop (read-char ip) i))
            (else (loop (read-char ip) (+ i 1)))))))

(define answer-017
  (reduce + 0
          (map count-letters
               (map number->word (range 1 1001)))))

(define (main)
  (display (format #t "Problem 17 answer: ~a~%" answer-017)))

(main)
