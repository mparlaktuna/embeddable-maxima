;;; Compiled by f2cl version:
;;; ("" "" "" "" "" "" "")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "COLNEW")


(defun gblock (h gi nrow irow wi vi kd rhsz rhsdmz ipvtw mode)
  (declare (type (array f2cl-lib:integer4 (*)) ipvtw)
           (type (array double-float (*)) rhsdmz rhsz wi)
           (type (f2cl-lib:integer4) mode kd irow nrow)
           (type (array double-float (*)) vi gi)
           (type double-float h))
  (let ((colord-m
         (make-array 20 :element-type 'f2cl-lib:integer4 :displaced-to
                     (colord-part-0 *colord-common-block*)
                     :displaced-index-offset 5))
        (colbas-b
         (make-array 28 :element-type 'double-float :displaced-to
                     (colbas-part-0 *colbas-common-block*)
                     :displaced-index-offset 0)))
    (symbol-macrolet ((k (aref (colord-part-0 *colord-common-block*) 0))
                      (ncomp (aref (colord-part-0 *colord-common-block*) 1))
                      (mstar (aref (colord-part-0 *colord-common-block*) 2))
                      (mmax (aref (colord-part-0 *colord-common-block*) 4))
                      (m colord-m)
                      (b colbas-b))
      (f2cl-lib:with-multi-array-data
          ((gi double-float gi-%data% gi-%offset%)
           (vi double-float vi-%data% vi-%offset%)
           (wi double-float wi-%data% wi-%offset%)
           (rhsz double-float rhsz-%data% rhsz-%offset%)
           (rhsdmz double-float rhsdmz-%data% rhsdmz-%offset%)
           (ipvtw f2cl-lib:integer4 ipvtw-%data% ipvtw-%offset%))
        (prog ((jcomp 0) (ll 0) (jd 0) (rsum 0.0) (ind 0) (jcol 0) (id 0)
               (mj 0) (icomp 0) (ir 0) (j 0) (l 0) (fact 0.0)
               (basm (make-array 5 :element-type 'double-float))
               (hb (make-array 28 :element-type 'double-float)))
          (declare (type (array double-float (28)) hb)
                   (type (array double-float (5)) basm)
                   (type double-float fact rsum)
                   (type (f2cl-lib:integer4) l j ir icomp mj id jcol ind jd ll
                    jcomp))
          (setf fact 1.0)
          (setf (f2cl-lib:fref basm (1) ((1 5))) 1.0)
          (f2cl-lib:fdo (l 1 (f2cl-lib:int-add l 1))
                        ((> l mmax) nil)
            (tagbody
              (setf fact (/ (* fact h) (f2cl-lib:dfloat l)))
              (setf (f2cl-lib:fref basm ((f2cl-lib:int-add l 1)) ((1 5))) fact)
              (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                            ((> j k) nil)
                (tagbody
                 label20
                  (setf (f2cl-lib:fref hb (j l) ((1 7) (1 4)))
                          (* fact (f2cl-lib:fref b (j l) ((1 7) (1 4)))))))
             label30))
          (f2cl-lib:computed-goto (label40 label110) mode)
         label40
          (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                        ((> j mstar) nil)
            (tagbody
              (f2cl-lib:fdo (ir 1 (f2cl-lib:int-add ir 1))
                            ((> ir mstar) nil)
                (tagbody
                  (setf (f2cl-lib:fref gi-%data%
                                       ((f2cl-lib:int-add
                                         (f2cl-lib:int-sub irow 1) ir)
                                        j)
                                       ((1 nrow) (1 1)) gi-%offset%)
                          0.0)
                 label50
                  (setf (f2cl-lib:fref gi-%data%
                                       ((f2cl-lib:int-add
                                         (f2cl-lib:int-sub irow 1) ir)
                                        (f2cl-lib:int-add mstar j))
                                       ((1 nrow) (1 1)) gi-%offset%)
                          0.0)))
             label60
              (setf (f2cl-lib:fref gi-%data%
                                   ((f2cl-lib:int-add (f2cl-lib:int-sub irow 1)
                                                      j)
                                    (f2cl-lib:int-add mstar j))
                                   ((1 nrow) (1 1)) gi-%offset%)
                      1.0)))
          (setf ir irow)
          (f2cl-lib:fdo (icomp 1 (f2cl-lib:int-add icomp 1))
                        ((> icomp ncomp) nil)
            (tagbody
              (setf mj (f2cl-lib:fref m (icomp) ((1 20))))
              (setf ir (f2cl-lib:int-add ir mj))
              (f2cl-lib:fdo (l 1 (f2cl-lib:int-add l 1))
                            ((> l mj) nil)
                (tagbody
                  (setf id (f2cl-lib:int-sub ir l))
                  (f2cl-lib:fdo (jcol 1 (f2cl-lib:int-add jcol 1))
                                ((> jcol mstar) nil)
                    (tagbody
                      (setf ind icomp)
                      (setf rsum 0.0)
                      (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                                    ((> j k) nil)
                        (tagbody
                          (setf rsum
                                  (- rsum
                                     (* (f2cl-lib:fref hb (j l) ((1 7) (1 4)))
                                        (f2cl-lib:fref vi-%data% (ind jcol)
                                                       ((1 kd) (1 1))
                                                       vi-%offset%))))
                         label70
                          (setf ind (f2cl-lib:int-add ind ncomp))))
                      (setf (f2cl-lib:fref gi-%data% (id jcol) ((1 nrow) (1 1))
                                           gi-%offset%)
                              rsum)
                     label80))
                  (setf jd (f2cl-lib:int-sub id irow))
                  (f2cl-lib:fdo (ll 1 (f2cl-lib:int-add ll 1))
                                ((> ll l) nil)
                    (tagbody
                      (setf (f2cl-lib:fref gi-%data%
                                           (id (f2cl-lib:int-add jd ll))
                                           ((1 nrow) (1 1)) gi-%offset%)
                              (-
                               (f2cl-lib:fref gi-%data%
                                              (id (f2cl-lib:int-add jd ll))
                                              ((1 nrow) (1 1)) gi-%offset%)
                               (f2cl-lib:fref basm (ll) ((1 5)))))
                     label85))
                 label90))
             label100))
          (go end_label)
         label110
          (dgesl wi kd kd ipvtw rhsdmz 0)
          (setf ir irow)
          (f2cl-lib:fdo (jcomp 1 (f2cl-lib:int-add jcomp 1))
                        ((> jcomp ncomp) nil)
            (tagbody
              (setf mj (f2cl-lib:fref m (jcomp) ((1 20))))
              (setf ir (f2cl-lib:int-add ir mj))
              (f2cl-lib:fdo (l 1 (f2cl-lib:int-add l 1))
                            ((> l mj) nil)
                (tagbody
                  (setf ind jcomp)
                  (setf rsum 0.0)
                  (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                                ((> j k) nil)
                    (tagbody
                      (setf rsum
                              (+ rsum
                                 (* (f2cl-lib:fref hb (j l) ((1 7) (1 4)))
                                    (f2cl-lib:fref rhsdmz-%data% (ind) ((1 1))
                                                   rhsdmz-%offset%))))
                     label120
                      (setf ind (f2cl-lib:int-add ind ncomp))))
                  (setf (f2cl-lib:fref rhsz-%data% ((f2cl-lib:int-sub ir l))
                                       ((1 1)) rhsz-%offset%)
                          rsum)
                 label130))
             label140))
          (go end_label)
         end_label
          (return (values nil nil nil nil nil nil nil nil nil nil nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::gblock
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '(double-float
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (array double-float (*))
                                              (array fortran-to-lisp::integer4
                                               (*))
                                              (fortran-to-lisp::integer4))
                                            :return-values
                                            '(nil nil nil nil nil nil nil nil
                                              nil nil nil)
                                            :calls '(fortran-to-lisp::dgesl))))

