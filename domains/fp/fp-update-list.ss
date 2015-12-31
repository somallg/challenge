#lang scheme

(define update-list
  (lambda (f l)
    (cond
      ((null? l) '())
      (else (cons (f (car l)) (update-list f (cdr l)))))))

(define (read-list)
  (let ([x (read)]) 
    (if (eof-object? x)
      (list)
      (cons x (read-list)))))

(let ([lst (read-list)]) 
  (let ([ans (update-list abs lst)])
    (for ([x ans])
         (printf "~a\n" x))))