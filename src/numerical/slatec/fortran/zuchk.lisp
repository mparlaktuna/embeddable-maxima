;;; Compiled by f2cl version:
;;; ("f2cl1.l,v 2bc8b118fd29 2011/12/03 06:01:32 toy $"
;;;  "f2cl2.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl3.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl4.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl5.l,v 2bc8b118fd29 2011/12/03 06:01:32 toy $"
;;;  "f2cl6.l,v 1d5cbacbb977 2008/08/24 00:56:27 rtoy $"
;;;  "macros.l,v fceac530ef0c 2011/11/26 04:02:26 toy $")

;;; Using Lisp SBCL 1.0.56
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "EM-SLATEC")


(defun zuchk (yr yi nz ascle tol)
  (declare (type (f2cl-lib:integer4) nz)
           (type (double-float) tol ascle yi yr))
  (prog ((ss 0.0) (st 0.0) (wr 0.0) (wi 0.0))
    (declare (type (double-float) wi wr st ss))
    (setf nz 0)
    (setf wr (abs yr))
    (setf wi (abs yi))
    (setf st (min wr wi))
    (if (> st ascle)
        (go end_label))
    (setf ss (max wr wi))
    (setf st (/ st tol))
    (if (< ss st)
        (setf nz 1))
    (go end_label)
   end_label
    (return (values nil nil nz nil nil))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::zuchk fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '((double-float) (double-float)
                                              (fortran-to-lisp::integer4)
                                              (double-float) (double-float))
                                            :return-values
                                            '(nil nil fortran-to-lisp::nz nil
                                              nil)
                                            :calls 'nil)))

