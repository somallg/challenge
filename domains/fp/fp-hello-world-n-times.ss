#lang scheme

(define hello
  (lambda (n h l)
    (cond
      ((zero? n) l)
      (else (cons h (hello (sub1 n) h l))))))

(define build-hello
  (lambda (l)
    (list->string (flatten l))))

(let ([n (read)]
      [h (string->list "Hello World\n")])
  (printf "~a~%" (build-hello (hello n h '()))))