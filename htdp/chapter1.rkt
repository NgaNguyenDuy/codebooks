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


;; Exercise 2.2.3
;; Define the program triangle. It consumes the length of a triangle's side and the perpendicular height. The program produces the area of a triangle.

;; Solution:
;; (h, b): number -> number (h for the perpendicular, and b for the lengeth of a triangle's side)
;; Example:
;; if the base is 10 and the height is 5, the area of triangle is 25
;; if the base is 2 and the height is 5, the area of triangle is 5
(define (triangle h b)
  (* 1/2 h b))


;; Exercise 2.2.4
;; Define the program convert3. It consumes three digits, starting with the least significant digit, followed by the next most significant one, and so on. The program produces the corresponding number.
;; Solution
;; (a b c): number -> number
;; c is hundred, b is tenth and a is unit.
;; Example:
;; (convert3 1 2 3) => 321
(define (convert3 a b c)
  (+ (* c 100) (* b 10) a))

;; Exercise 2.2.5
;;
(define (f n)
  "Return the result from n."
  (+ (sqr n) 10))

;; Exercise 2.3.1
;; Utopia's tax accountants alway use programs that compute income taxes even though the tax rate is a solid, never-changing 15%. Define the program tax, which determines the tax on the gross pay.

;; Also define netpay. The program determines the net pay of an employee from the number of hours worked.Assumed an hourly rate of $12.

(define (tax s)
  (* s 0.15))

(define (netpay h)
  (- (* 12 h) (tax (* 12 h))))


;; Exercise 2.3.2
;; Compute the bag of coin.
;; the pennies = 1 cent, the nickels = 5 cents, the dime = 10 cents and the quaters = 25 cents.
;;
(define (sum-coints p n d q)
  (+ p (* n 5) (* d 10) (* q 25)))


