;;; Compiled by f2cl version:
;;; ("" "" "" "" "" "" "")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "SLATEC")


(let ((onepl 0.0) (first$ nil))
  (declare (type (double-float) onepl)
           (type f2cl-lib:logical first$))
  (setq first$ f2cl-lib:%true%)
  (defun dcsevl (x cs n)
    (declare (type (f2cl-lib:integer4) n)
             (type (array double-float (*)) cs)
             (type (double-float) x))
    (f2cl-lib:with-multi-array-data
        ((cs double-float cs-%data% cs-%offset%))
      (prog ((b0 0.0) (b1 0.0) (b2 0.0) (twox 0.0) (dcsevl 0.0) (ni 0) (i 0))
        (declare (type (f2cl-lib:integer4) i ni)
                 (type (double-float) dcsevl twox b2 b1 b0))
        (if first$
            (setf onepl (+ 1.0 (f2cl-lib:d1mach 4))))
        (setf first$ f2cl-lib:%false%)
        (if (< n 1)
            (xermsg "SLATEC" "DCSEVL" "NUMBER OF TERMS  <=  0" 2 2))
        (if (> n 1000)
            (xermsg "SLATEC" "DCSEVL" "NUMBER OF TERMS  >  1000" 3 2))
        (if (> (abs x) onepl)
            (xermsg "SLATEC" "DCSEVL" "X OUTSIDE THE INTERVAL (-1,+1)" 1 1))
        (setf b1 0.0)
        (setf b0 0.0)
        (setf twox (* 2.0 x))
        (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                      ((> i n) nil)
          (tagbody
            (setf b2 b1)
            (setf b1 b0)
            (setf ni (f2cl-lib:int-sub (f2cl-lib:int-add n 1) i))
            (setf b0
                    (+ (- (* twox b1) b2)
                       (f2cl-lib:fref cs-%data% (ni) ((1 *)) cs-%offset%)))
           label10))
        (setf dcsevl (* 0.5 (- b0 b2)))
        (go end_label)
       end_label
        (return (values dcsevl nil nil nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::dcsevl
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '((double-float)
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4))
                                            :return-values '(nil nil nil)
                                            :calls
                                            '(fortran-to-lisp::xermsg
                                              fortran-to-lisp::d1mach))))
