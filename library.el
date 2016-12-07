;; library.el -- generally useful functions -*- lexical-binding: t -*-
(require 'cl-lib)

(defun do-some-magic ()
  "This is just a placeholder for some code I haven't figured out yet."
  )

(defun assoc-keys-for-values (alist value &optional test)
  "Return a list of all keys in ALIST for which (TEST key VALUE) is 't'. TEST defaults to `equal'."
  (let ((thetest (or test 'equal)))
      (cl-remove-if 'null (mapcar (lambda (elem)
                                    (if (funcall thetest (cdr elem) value)
                                        (car elem)))
                                  alist))))

(defun merge-inverted-alist (new-element inverted-alist)
  "If car of NEW-ELEMENT is a key in INVERTED-ALIST, add its value to the value list for that key."
  (if (alist-get (car new-element) inverted-alist)
      (do-some-magic)
    (setf (alist-get (car new-element) inverted-alist)
          (cdr new-element))))
  
(defun invert-alist (alist)
  "Returns the inversion of ALIST: an alist keyed by the values of ALIST, with each value a list of the keys with that value."
  (if (equal (length alist) 1)
      (list (cons (cdar alist) (caar alist)))
    (merge-inverted-alist
     (cons (cdar alist) (caar alist))
     (invert-alist (cdr alist)))))

(defun do-library-tests ()
  (cl-assert (equal (assoc-keys-for-values '((1 . 2)(3 . 4)(4 . 2)(5 . 6)) 2) '(1 4)))
  (cl-assert (equal (assoc-keys-for-values '(()) 3 'eql) nil))
  (cl-assert (equal (assoc-keys-for-values '((1 . (1 2))(3 . 4)(4 . 2)(5 . 6)) '(1 2)) '(1)))
  (cl-assert (equal (assoc-keys-for-values '((1 . (1 2))(3 . 4)(4 . 2)(5 . 6)) '(1 2) 'eql) nil)))

(do-library-tests)
