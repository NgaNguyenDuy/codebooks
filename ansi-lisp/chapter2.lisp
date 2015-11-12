;; Exercises for chapter 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Describe what happens when the following expressions are evaluated:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(+ (- 5 1) (+ 3 7)) ;; > Because the arguments are evaluated left-to-right, and their values are passed to the function denoted by the operator. So final result is 14

(list 1 (+ 2 3)) ;; The list keyword to create a new list in common lisp. If the list is quoted, evaluation returns the list itself, if not quoted, the list is treated as code and evaluation returns its value. So, 1 evaluates by 1, (+ 2 3) evaluates by 5 (2 + 3) then final results is (1 5)

(if (listp 1) (+ 1 2) (+ 3 4)) ;; if is simplest conditional in common lisp. It usually takes three arguments: a "test" expression, a "then" expression and a "else" expression. The "test" expression is evaluated. if it returns true, the "then" expression is evaluated and its value is returned. If the "test" expression returns false, the "else" expression is evaluated and its value is returned. Well, in this case, (lisp 1) is "test" expression, (+ 1 2) is "then" expression and (+ 3 4) is "else" expression. obviously (listp 1) is return false so the "else" expression is evaluated, that mean (+ 3 4) is returned and the value is 7.

(list (and (listp 3) 1) (+ 1 2)) ;; Here we have the "and" operator which return the last expression if all of arguments are returned true. Because (listp 3) returns false so (and (listp 3) 1) is returns NIL. So the value of this expression is a list: (NIL 3)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Give three distinct cons expressions that return (a b c).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(cons 'a '(b c))
(cons 'a (cons 'b (cons 'c nil)))
(cons 'a (cons 'b (cons 'c ())))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Using car and cdr, define funtion to return the fourth element of a list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter x '(a n s i l i s p))

(defun fourth-elem (lst)
  "Return the fourth element of a list."
  (car (cdr (cdr (cdr lst)))))

(fourth-elem x) ; should return i



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Define a function that takes two arguments and returns the greater of the two.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun greater-of-two (fnum snum)
  "Return the greater of the two."
  (if (> fnum snum)
      fnum
      snum))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. What do these functions do?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
           (enigma (cdr x)))))

;; -> the function enigma always return nil value with any value of x (remember x must is a list)

(defun mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (mystery x (cdr y))))
            (and z (+ z 1))))))

;; -> The function mystery will return the position of x in y (y is a list) count from 0. Example, (x '(3)) and (y '(1 2 3 4)) so if we call (mystery x y), it should return 2 (2 is position of 3 in list y count from 0). Check the code.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. What could occur in place of the x in each of the following exchanges?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (car (x (cdr '(a (b c) d)))) ;; Should return B so x is "car" operator. Let me explain it. We will evaluate from innermost, which the value of (cdr '(a (b c) d)) returns, its value is ((b c) d). So, we need the element has contain B, and the first element of the value has contain it (B), so we must using the car operator to get it. Finally, we will get B element.

;; (x 13 (/ 1 0)) ;; Should return 13 so x must be "or" operator. Because the expression (/1 0) always return false, so if we using the "and" operator, it will return nil.

;; (x #'list 1 nil) ;; Should return (1). At here, we have two choice for x, the first is apply, and the second is funcall. Two functions is same but there is a difference, that is "apply" will take a function and a list of arguments for it, and "funcall" does not need the arguments to be packaged in a list. So, at here, we have not arguments packaged in a list and we will using "funcall" for x.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7. Using only operations introduced in this chapter, define a function that
;; takes a list as an argument and return true if one its elements is a list.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; check_list(): list -> boolean

(defun check_list (lst)
  "Return true if lst has a list."
  (if (null lst)
      nil
      (if (listp (car lst))
          t
          (check_list (cdr lst)))
      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. A friend is trying to write function that returns the sum of all the
;; non-nil elements in a list. He was written two versions of this function,
;; and neither of them work. Explain what's wrong witch each, and give a
;; correct version.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; First version:
;; (a) (defun summit (1st)
;;       (remove nil 1st)
;;       (apply #'+ 1st))

;; What's wrong? The arguments of apply function must be a list. 1st is a list. But the function + must require all of elements must be a number. So we can modify it as bellow:
(defun summit_new_ver (1st)
  "Return the sum of all the non-nin elements in a list."
  (length (remove nil 1st)))

;; Second version:
;; (b) (defun summit (1st)
;;       (let ((x (car 1st)))
;;         (if (null x)
;;             (summit (cdr 1st))
;;             (+ x (summit (cdr 1st))))))

;; We need the base case to break recursion function (conditional when the input list is empty). So the correct version is bellow:

(defun summit_rec_new_ver (1st)
  "Return the sum of all the non-nil elements in a list."
  (if (null 1st)
      0
      (let ((x (car 1st)))
        (if (null x)
            (xyz (cdr 1st))
            (+ 1 (xyz (cdr 1st)))))))
