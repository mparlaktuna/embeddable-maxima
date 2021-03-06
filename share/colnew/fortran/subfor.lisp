;;; Compiled by f2cl version:
;;; ("" "" "" "" "" "" "")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "COLNEW")


(defun subfor (w ipivot nrow last$ x)
  (declare (type (f2cl-lib:integer4) last$ nrow)
           (type (array f2cl-lib:integer4 (*)) ipivot)
           (type (array double-float (*)) x w))
  (f2cl-lib:with-multi-array-data
      ((w double-float w-%data% w-%offset%)
       (x double-float x-%data% x-%offset%)
       (ipivot f2cl-lib:integer4 ipivot-%data% ipivot-%offset%))
    (prog ((t$ 0.0) (ip 0) (k 0) (kp1 0) (lstep 0) (i 0))
      (declare (type (f2cl-lib:integer4) i lstep kp1 k ip)
               (type (double-float) t$))
      (if (= nrow 1)
          (go end_label))
      (setf lstep (f2cl-lib:min0 (f2cl-lib:int-sub nrow 1) last$))
      (f2cl-lib:fdo (k 1 (f2cl-lib:int-add k 1))
                    ((> k lstep) nil)
        (tagbody
          (setf kp1 (f2cl-lib:int-add k 1))
          (setf ip
                  (f2cl-lib:fref ipivot-%data% (k) ((1 last$))
                                 ipivot-%offset%))
          (setf t$ (f2cl-lib:fref x-%data% (ip) ((1 nrow)) x-%offset%))
          (setf (f2cl-lib:fref x-%data% (ip) ((1 nrow)) x-%offset%)
                  (f2cl-lib:fref x-%data% (k) ((1 nrow)) x-%offset%))
          (setf (f2cl-lib:fref x-%data% (k) ((1 nrow)) x-%offset%) t$)
          (if (= t$ 0.0)
              (go label20))
          (f2cl-lib:fdo (i kp1 (f2cl-lib:int-add i 1))
                        ((> i nrow) nil)
            (tagbody
             label10
              (setf (f2cl-lib:fref x-%data% (i) ((1 nrow)) x-%offset%)
                      (+ (f2cl-lib:fref x-%data% (i) ((1 nrow)) x-%offset%)
                         (*
                          (f2cl-lib:fref w-%data% (i k) ((1 nrow) (1 last$))
                                         w-%offset%)
                          t$)))))
         label20))
     label30
      (go end_label)
     end_label
      (return (values nil nil nil nil nil)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::subfor
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '((array double-float (*))
                                              (array fortran-to-lisp::integer4
                                               (*))
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*)))
                                            :return-values
                                            '(nil nil nil nil nil) :calls
                                            'nil)))

