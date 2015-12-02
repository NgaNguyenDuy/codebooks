#lang racket

;; profit: number -> number
;; to compute profit as the difference between revenue and costs at some given ticket-price
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price))
  )

;; revenue: number -> number
;; to compute revenue, given ticket-price
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price)
  )

;; cost: number -> number
;; to compute costs, given ticket-price
(define (cost ticket-price)
  (+ 180 (* (attendees ticket-price) .04))
  )

;; cost-new: number -> number
;; to compute costs to reflect the change of owner, given ticket-price
(define (cost-new ticket-price)
  (* (attendees ticket-price) 1.5)
  )

;; profit-new: number -> number
;; to compute profit with new change, given ticket-price
(define (profit-new ticket-price)
  (- (revenue ticket-price)
     (cost-new ticket-price))
  )


;; attendees: number -> number
;; to compute the number of attendees, given ticket-price
;; Example:
;; at $5 we get 120 attendees
;; at $4.9, we get 135 attendees
(define (attendees ticket-price)
  (+ (* (/ 15 .1) (- 5 ticket-price)) 120)
  )

;; Example TEST
(attendees 5.0) "should be" 120
(attendees 4.9) "should be" 135
(attendees 4) "should be" 270
(attendees 3) "should be" 420

;; at $3, it costs (+ 180 (* 420 .04)) = 196.8 per show.
;; at $4, it costs (+ 180 (* 270 .04)) = 190.8 per show.
;; at $5, it costs (+ 180 (* 120 .04)) = 184.8 per show.

;; at $3, the movie owner makes (* 420 3) = $1260 per show.
;; at $4, the movie owner makes (* 270 4) = $1080 per show.
;; at $5, the movie owner makes (* 120 5) = $600 per show.

;; ==> the best price is $3.

(define (profit-left ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price))
  )

(define (profit-right ticket-price)
  (- (* (+ 120
           (* (/ 15 .10)
              (- 5.00 ticket-price)))
        ticket-price)
     (+ 180 
        (* .04
           (+ 120
              (* (/ 15 .10)
                 (- 5.00 ticket-price)))))))

(profit-left 3) "should be" (profit-right 3)
(profit-left 4) "should be" (profit-right 4)
(profit-left 5) "should be" (profit-right 5)



;; inches->cm: number -> number
;; to convert from inch into cm, given inch value
;; Examples:
;; with 1 inch -> 2.54 cm
;; with 7 inch -> 17.78 cm
(define (inches->cm v)
  (* v incm))

;; feet->inches: number -> number
;; to convert from feet into inches
;; Example:
;; 2 feet -> 24 inches
;; 10 feet -> 120 inches
(define (feet->inches f)
  (* f 12))

;; feet->cm: number -> number
;; to convert from feet into cm
(define (feet->cm f)
  (inches->cm (feet->inches f))
  )

