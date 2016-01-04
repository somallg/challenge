#lang scheme

; helper function
(define read->lat
  (lambda ()
    (let ([n (read)])
      (cond
        ((eof-object? n) '())
        (else (cons n (read->lat)))))))

(define lat->string
  (lambda (l)
    (cond
      ((null? l) "")
      (else (string-append (format "~a" (car l)) "\n" (lat->string (cdr l)))))))
; helper function end

;(define ^
;  (lambda (x n)
;    (cond
;      ((zero? n) 1)
;      (else (* x (^ x (sub1 n)))))))

(define p
  (lambda (la lb x)
    (cond
      ((or (null? la) (null? lb)) 0)
      (else (+ (* (car la) (expt x (car lb))) (p (cdr la) (cdr lb) x))))))

(define area
  (lambda (la lb step low)
    (cond
      (else (exact->inexact (* (p la lb (+ low step)) step))))))

(define volume
  (lambda (la lb step low)
    (cond
      (else (exact->inexact (* pi (expt (p la lb (+ low step)) 2) step))))))

(define compute
  (lambda (f la lb step low high)
    (cond
      ((>= low high) 0)
      (else (+ (f la lb step low) (compute f la lb step (+ low step) high))))))


(define list-char->lat
  (lambda (ls)
    (cond
      ((or (null? ls) ) '())
      ((char=? (car ls) #\space) (list-char->lat (cdr ls)))
      (else (cons (- (char->integer (car ls)) (char->integer #\0)) (list-char->lat (cdr ls)))))))

(define less-than-eq
  (lambda (n)
    (lambda (m)
      (<= m n))))

(define more-than
  (lambda (n)
    (lambda (m)
      (> m n))))

(define my-filter
  (lambda (f n l)
    (cond
      ((null? l) '())
      ((f n) (cons (car l) (my-filter f (add1 n) (cdr l))))
      (else (my-filter f (add1 n) (cdr l))))))

; main
(define pi 3.141592653)
(let ([l (read->lat)])
  (let ([rl (reverse l)])
    (let ([le (/ (- (length l) 2) 2)])
      (let ([high (car rl)])
        (let ([low (car (cdr rl))])
          (let ([la (my-filter (less-than-eq le) 1 l)])
            (let ([lb (my-filter (more-than le) 1 l)])
             (let ([step (/ 1 1024)])
               (let ([o1 (exact->inexact (compute area la lb step low high))])
                 (let ([o2  (exact->inexact (compute volume la lb step low high))])
                   (printf (format "~a\n" o1))
                   (printf (format "~a\n" o2))))))))))))