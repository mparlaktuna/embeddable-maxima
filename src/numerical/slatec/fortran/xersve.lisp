;;; Compiled by f2cl version:
;;; ("" "" "" "" "" "" "")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "SLATEC")


(let* ((lentab 10))
  (declare (type (f2cl-lib:integer4 10 10) lentab)
           (ignorable lentab))
  (let ((nmsg 0)
        (kountx 0)
        (kount (make-array lentab :element-type 'f2cl-lib:integer4))
        (levtab (make-array lentab :element-type 'f2cl-lib:integer4))
        (nertab (make-array lentab :element-type 'f2cl-lib:integer4))
        (mestab (f2cl-lib:f2cl-init-string ((+ 1 (- lentab 1))) (20) nil))
        (subtab (f2cl-lib:f2cl-init-string ((+ 1 (- lentab 1))) (8) nil))
        (libtab (f2cl-lib:f2cl-init-string ((+ 1 (- lentab 1))) (8) nil)))
    (declare (type (f2cl-lib:integer4) nmsg kountx)
             (type (array f2cl-lib:integer4 (*)) kount levtab nertab)
             (type (array (simple-array character (20)) (*)) mestab)
             (type (array (simple-array character (8)) (*)) subtab libtab))
    (defun xersve (librar subrou messg kflag nerr level icount)
      (declare (type (f2cl-lib:integer4) icount level nerr kflag)
               (type (simple-array character (*)) messg subrou librar))
      (f2cl-lib:with-multi-array-data
          ((librar character librar-%data% librar-%offset%)
           (subrou character subrou-%data% subrou-%offset%)
           (messg character messg-%data% messg-%offset%))
        (prog ((mes
                (make-array '(20) :element-type 'character :initial-element
                            #\ ))
               (lib
                (make-array '(8) :element-type 'character :initial-element
                            #\ ))
               (sub
                (make-array '(8) :element-type 'character :initial-element
                            #\ ))
               (lun (make-array 5 :element-type 'f2cl-lib:integer4)) (i 0)
               (iunit 0) (kunit 0) (nunit 0))
          (declare (type (f2cl-lib:integer4) nunit kunit iunit i)
                   (type (simple-array character (20)) mes)
                   (type (simple-array character (8)) lib sub)
                   (type (array f2cl-lib:integer4 (5)) lun))
          (cond
           ((<= kflag 0)
            (if (= nmsg 0)
                (go end_label))
            (multiple-value-bind (var-0 var-1)
                (xgetua lun nunit)
              (declare (ignore var-0))
              (setf nunit var-1))
            (f2cl-lib:fdo (kunit 1 (f2cl-lib:int-add kunit 1))
                          ((> kunit nunit) nil)
              (tagbody
                (setf iunit (f2cl-lib:fref lun (kunit) ((1 5))))
                (if (= iunit 0)
                    (setf iunit (f2cl-lib:i1mach 4)))
                (f2cl-lib:fformat iunit
                                  ("0          ERROR MESSAGE SUMMARY" "~%"
                                   " LIBRARY    SUBROUTINE MESSAGE START             NERR"
                                   "     LEVEL     COUNT" "~%"))
                (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                              ((> i nmsg) nil)
                  (tagbody
                    (f2cl-lib:fformat iunit
                                      ("~1@T" ("~A") "~3@T" ("~A") "~3@T"
                                       ("~A") 3 (("~10D")) "~%")
                                      (f2cl-lib:fref libtab (i) ((1 lentab)))
                                      (f2cl-lib:fref subtab (i) ((1 lentab)))
                                      (f2cl-lib:fref mestab (i) ((1 lentab)))
                                      (f2cl-lib:fref nertab (i) ((1 lentab)))
                                      (f2cl-lib:fref levtab (i) ((1 lentab)))
                                      (f2cl-lib:fref kount (i) ((1 lentab))))
                   label10))
                (if (/= kountx 0)
                    (f2cl-lib:fformat iunit
                                      ("0OTHER ERRORS NOT INDIVIDUALLY TABULATED = "
                                       1 (("~10D")) "~%")
                                      kountx))
                (f2cl-lib:fformat iunit ("~1@T" "~%"))
               label20))
            (cond ((= kflag 0) (setf nmsg 0) (setf kountx 0))))
           (t (f2cl-lib:f2cl-set-string lib librar (string 8))
            (f2cl-lib:f2cl-set-string sub subrou (string 8))
            (f2cl-lib:f2cl-set-string mes messg (string 20))
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i nmsg) nil)
              (tagbody
                (cond
                 ((and
                   (f2cl-lib:fstring-= lib
                                       (f2cl-lib:fref libtab (i) ((1 lentab))))
                   (f2cl-lib:fstring-= sub
                                       (f2cl-lib:fref subtab (i) ((1 lentab))))
                   (f2cl-lib:fstring-= mes
                                       (f2cl-lib:fref mestab (i) ((1 lentab))))
                   (= nerr (f2cl-lib:fref nertab (i) ((1 lentab))))
                   (= level (f2cl-lib:fref levtab (i) ((1 lentab)))))
                  (setf (f2cl-lib:fref kount (i) ((1 lentab)))
                          (f2cl-lib:int-add
                           (f2cl-lib:fref kount (i) ((1 lentab))) 1))
                  (setf icount (f2cl-lib:fref kount (i) ((1 lentab))))
                  (go end_label)))
               label30))
            (cond
             ((< nmsg lentab) (setf nmsg (f2cl-lib:int-add nmsg 1))
              (f2cl-lib:f2cl-set-string (f2cl-lib:fref libtab (i) ((1 lentab)))
                                        lib (string 8))
              (f2cl-lib:f2cl-set-string (f2cl-lib:fref subtab (i) ((1 lentab)))
                                        sub (string 8))
              (f2cl-lib:f2cl-set-string (f2cl-lib:fref mestab (i) ((1 lentab)))
                                        mes (string 20))
              (setf (f2cl-lib:fref nertab (i) ((1 lentab))) nerr)
              (setf (f2cl-lib:fref levtab (i) ((1 lentab))) level)
              (setf (f2cl-lib:fref kount (i) ((1 lentab))) 1) (setf icount 1))
             (t (setf kountx (f2cl-lib:int-add kountx 1)) (setf icount 0)))))
          (go end_label)
         end_label
          (return (values nil nil nil nil nil nil icount)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::xersve
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '((simple-array character (*))
                                              (simple-array character (*))
                                              (simple-array character (*))
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4))
                                            :return-values
                                            '(nil nil nil nil nil nil
                                              fortran-to-lisp::icount)
                                            :calls
                                            '(fortran-to-lisp::i1mach
                                              fortran-to-lisp::xgetua))))
