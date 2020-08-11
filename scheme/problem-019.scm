;;; Problem 19 solution

(cond-expand
  (chicken-5 (import (chicken format)))
  (chicken-4 (import format))
  (guile '()))

(define (divides? x y)
  (zero? (remainder x y)))

(define (leap-year? year)
  (or (divides? year 400)
      (and (divides? year 4)
           (not (divides? year 100)))))

(define (date-step date)
  (match-let [((day month year) date)]
    (case month
      [(4 6 9 11)
       (if (= day 30)
           (list 1 (+ month 1) year)
           (list (+ day 1) month year))]
      [(1 3 5 7 8 10 12)
       (cond [(and (= day 31) (= month 12)
                   (list 1 1 (+ year 1)))]
             [(= day 31) (list 1 (+ month 1) year)]
             [else (list (+ day 1) month year)])]
      [else (if (leap-year? year)
                (if (= day 29)
                    (list 1 (+ month 1) year)
                    (list (+ day 1) month year))
                (if (= day 28)
                    (list 1 (+ month 1) year)
                    (list (+ day 1) month year)))])))

(define (date-stepper start-date days)
  (let loop ([current-day 0]
             [current-date start-date])
    (if (> current-day days)
        current-date
        (loop (+ current-day 1) (date-step current-date)))))

(define answer-019
  (let loop [(date '(7 1 1900))
             (sunday-firsts 0)]
    (cond [(= (third date) 2001) sunday-firsts]
          [(and (= (first date) 1) (>= (third date) 1901))
           (loop (date-stepper date 6) (+ sunday-firsts 1))]
          [else (loop (date-stepper date 6) sunday-firsts)])))

(define (main)
  (display (format "Problem 19 answer: ~a~%" answer-019)))

(main)
