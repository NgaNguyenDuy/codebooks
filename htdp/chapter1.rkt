#lang racket

;; Exercise 2.1.1:
;; Find out whether DrScheme has operations for squaring a number; for computing the sine of an angle; and for determining the maximum of two numbers.
(sqr 2)
(sin 30)
(max 5 7)


;; Exercise 2.1.2:
;; Evaluate (sqrt 4), (sqrt 2), and (sqrt -1) in DrScheme. Then find out whether DrScheme knows an operation for determining the tangent of an angle.

(sqrt 4)
(sqrt 2)
(sqrt -1)
(tan 1)


;; Exercise 2.2.1
;; Define the program Fahrenheit->Celsius, which consumes a temperature measured in Fahrenheit and produces the Celsius equivalent. Use a chemistry or physics book to look up the conversion formular.

;; Solution:
;; fahrenheit->celsius: number -> number
;; computes the celsius equivalent of f
;; Example:
;; 32 degrees fahrenheit is 0 degrees celsius
;; 212 degrees fahrenheit is 100 degrees celsius
;; -40 degrees fahrenheit is -40 degrees celsius

(define (Fahrenheit->Celsius f)
  (* (- f 32) 5/9))



;; Exercise 2.2.2:
;; Define the program dollar->euro, which consumes a number of dollars and produces the euro equivalent. Use the currency table in the newpaper to look up the current exchange rate.

;; Solution:
;; dollar->euro: number -> number
;; computes the euro equivalent of d
;; Example:
;; 100 dollars is 93 euro
;; 150 dollars is 139.5 euro

(define (dollar->euro d)
  (* d 0.93))
