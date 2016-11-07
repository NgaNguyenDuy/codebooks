#lang racket

;; is-5?: number -> boolean
;; to determine whether n is equal to 5
(define (is-5? n)
  (= n 5))

;; is-between-5-6? : number -> boolean
;; to determine whether n is between 5 and 6 (exclusive)
(define (is-between-5-6? n)
  (and (> n 5) (< n 6)))
