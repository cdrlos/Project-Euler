#|
Maximum path sum I
Problem 18
|#

#lang racket/base
(require racket/string)


(define (string->integer str)
  (let [(s (open-input-string str))]
    (let loop ((c (read-char s))
               (int 0))
      (if (eof-object? c)
          int
          (loop (read-char s)
                (+ (* 10 int) (- (char->integer c)
                                 (char->integer #\0))))))))

(define (read-integer-triangle file)
  (let [(triangle (open-input-file file))]
    (let loop-1 [(line (read-line triangle))
                 (out '())]
      (if (eof-object? line)
          out
          (let loop-2 ((ints (string-split line))
                       (out2 '()))
            (if (null? ints)
                (loop-1 (read-line triangle)
                        (cons out2 out))
                (loop-2 (cdr ints)
                        (cons (string->integer (car ints)) out2))))))))

(define (maximum-path-sum upturned-tree)
  (let loop-0 [(pruned-tree (cdr upturned-tree))
               (path-sums (car upturned-tree))]
    (if (null? pruned-tree)
        (car path-sums)
        (let loop-1 [(current-values path-sums)
                     (best-values '())]
          (cond [(null? (cdr current-values))
                 (loop-0 (cdr pruned-tree)
                         (let loop-2 [(xs (car pruned-tree))
                                      (ys (reverse best-values))
                                      (zs '())]
                           (if (null? xs)
                               (reverse zs)
                               (loop-2 (cdr xs)
                                       (cdr ys)
                                       (cons (+ (car xs) (car ys)) zs)))))]
                [(> (car current-values)
                    (cadr current-values))
                 (loop-1 (cdr current-values)
                         (cons (car current-values) best-values))]
                [else (loop-1 (cdr current-values)
                              (cons (cadr current-values) best-values))])))))

(define answer-018
  (maximum-path-sum (read-integer-triangle "problem-018-data.txt")))

(define (main)
  (display (format "Problem 18 answer: ~a~%" answer-018)))

(main)
