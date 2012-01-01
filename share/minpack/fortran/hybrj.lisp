;;; Compiled by f2cl version:
;;; ("" "" "" "" "" "" "")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls nil)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "MINPACK")


(let ((one 1.0) (p1 0.1) (p5 0.5) (p001 0.001) (p0001 1.e-4) (zero 0.0))
  (declare (type (double-float) one p1 p5 p001 p0001 zero))
  (defun hybrj
         (fcn n x fvec fjac ldfjac xtol maxfev diag mode factor nprint info
          nfev njev r lr qtf wa1 wa2 wa3 wa4)
    (declare (type (double-float) factor xtol)
             (type (array double-float (*)) wa4 wa3 wa2 wa1 qtf r diag fjac
              fvec x)
             (type (f2cl-lib:integer4) lr njev nfev info nprint mode maxfev
              ldfjac n))
    (f2cl-lib:with-multi-array-data
        ((x double-float x-%data% x-%offset%)
         (fvec double-float fvec-%data% fvec-%offset%)
         (fjac double-float fjac-%data% fjac-%offset%)
         (diag double-float diag-%data% diag-%offset%)
         (r double-float r-%data% r-%offset%)
         (qtf double-float qtf-%data% qtf-%offset%)
         (wa1 double-float wa1-%data% wa1-%offset%)
         (wa2 double-float wa2-%data% wa2-%offset%)
         (wa3 double-float wa3-%data% wa3-%offset%)
         (wa4 double-float wa4-%data% wa4-%offset%))
      (prog ((actred 0.0) (delta 0.0) (epsmch 0.0) (fnorm 0.0) (fnorm1 0.0)
             (pnorm 0.0) (prered 0.0) (ratio 0.0) (sum 0.0) (temp 0.0)
             (xnorm 0.0) (jeval nil) (sing nil)
             (iwa (make-array 1 :element-type 'f2cl-lib:integer4)) (i 0)
             (iflag 0) (iter 0) (j 0) (jm1 0) (l 0) (ncfail 0) (ncsuc 0)
             (nslow1 0) (nslow2 0))
        (declare
         (type (f2cl-lib:integer4) nslow2 nslow1 ncsuc ncfail l jm1 j iter
          iflag i)
         (type (array f2cl-lib:integer4 (1)) iwa)
         (type f2cl-lib:logical sing jeval)
         (type (double-float) xnorm temp sum ratio prered pnorm fnorm1 fnorm
          epsmch delta actred))
        (setf epsmch (dpmpar 1))
        (setf info 0)
        (setf iflag 0)
        (setf nfev 0)
        (setf njev 0)
        (if (or (<= n 0) (< ldfjac n) (< xtol zero) (<= maxfev 0)
                (<= factor zero)
                (< lr (the f2cl-lib:integer4 (truncate (* n (+ n 1)) 2))))
            (go label300))
        (if (/= mode 2)
            (go label20))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (if (<= (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%) zero)
                (go label300))
           label10))
       label20
        (setf iflag 1)
        (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
            (funcall fcn n x fvec fjac ldfjac iflag)
          (declare (ignore var-1 var-2 var-3))
          (when var-0 (setf n var-0))
          (when var-4 (setf ldfjac var-4))
          (when var-5 (setf iflag var-5)))
        (setf nfev 1)
        (if (< iflag 0)
            (go label300))
        (setf fnorm (enorm n fvec))
        (setf iter 1)
        (setf ncsuc 0)
        (setf ncfail 0)
        (setf nslow1 0)
        (setf nslow2 0)
       label30
        (setf jeval f2cl-lib:%true%)
        (setf iflag 2)
        (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
            (funcall fcn n x fvec fjac ldfjac iflag)
          (declare (ignore var-1 var-2 var-3))
          (when var-0 (setf n var-0))
          (when var-4 (setf ldfjac var-4))
          (when var-5 (setf iflag var-5)))
        (setf njev (f2cl-lib:int-add njev 1))
        (if (< iflag 0)
            (go label300))
        (qrfac n n fjac ldfjac f2cl-lib:%false% iwa 1 wa1 wa2 wa3)
        (if (/= iter 1)
            (go label70))
        (if (= mode 2)
            (go label50))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                    (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%))
            (if (= (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%) zero)
                (setf (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                        one))
           label40))
       label50
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf (f2cl-lib:fref wa3-%data% (j) ((1 n)) wa3-%offset%)
                    (* (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                       (f2cl-lib:fref x-%data% (j) ((1 n)) x-%offset%)))
           label60))
        (setf xnorm (enorm n wa3))
        (setf delta (* factor xnorm))
        (if (= delta zero)
            (setf delta factor))
       label70
        (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                      ((> i n) nil)
          (tagbody
            (setf (f2cl-lib:fref qtf-%data% (i) ((1 n)) qtf-%offset%)
                    (f2cl-lib:fref fvec-%data% (i) ((1 n)) fvec-%offset%))
           label80))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (if (=
                 (f2cl-lib:fref fjac-%data% (j j) ((1 ldfjac) (1 n))
                                fjac-%offset%)
                 zero)
                (go label110))
            (setf sum zero)
            (f2cl-lib:fdo (i j (f2cl-lib:int-add i 1))
                          ((> i n) nil)
              (tagbody
                (setf sum
                        (+ sum
                           (*
                            (f2cl-lib:fref fjac-%data% (i j) ((1 ldfjac) (1 n))
                                           fjac-%offset%)
                            (f2cl-lib:fref qtf-%data% (i) ((1 n))
                                           qtf-%offset%))))
               label90))
            (setf temp
                    (/ (- sum)
                       (f2cl-lib:fref fjac-%data% (j j) ((1 ldfjac) (1 n))
                                      fjac-%offset%)))
            (f2cl-lib:fdo (i j (f2cl-lib:int-add i 1))
                          ((> i n) nil)
              (tagbody
                (setf (f2cl-lib:fref qtf-%data% (i) ((1 n)) qtf-%offset%)
                        (+ (f2cl-lib:fref qtf-%data% (i) ((1 n)) qtf-%offset%)
                           (*
                            (f2cl-lib:fref fjac-%data% (i j) ((1 ldfjac) (1 n))
                                           fjac-%offset%)
                            temp)))
               label100))
           label110
           label120))
        (setf sing f2cl-lib:%false%)
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf l j)
            (setf jm1 (f2cl-lib:int-sub j 1))
            (if (< jm1 1)
                (go label140))
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i jm1) nil)
              (tagbody
                (setf (f2cl-lib:fref r-%data% (l) ((1 lr)) r-%offset%)
                        (f2cl-lib:fref fjac-%data% (i j) ((1 ldfjac) (1 n))
                                       fjac-%offset%))
                (setf l (f2cl-lib:int-sub (f2cl-lib:int-add l n) i))
               label130))
           label140
            (setf (f2cl-lib:fref r-%data% (l) ((1 lr)) r-%offset%)
                    (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%))
            (if (= (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%) zero)
                (setf sing f2cl-lib:%true%))
           label150))
        (qform n n fjac ldfjac wa1)
        (if (= mode 2)
            (go label170))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                    (f2cl-lib:dmax1
                     (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                     (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%)))
           label160))
       label170
       label180
        (if (<= nprint 0)
            (go label190))
        (setf iflag 0)
        (if (= (mod (f2cl-lib:int-sub iter 1) nprint) 0)
            (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
                (funcall fcn n x fvec fjac ldfjac iflag)
              (declare (ignore var-1 var-2 var-3))
              (when var-0 (setf n var-0))
              (when var-4 (setf ldfjac var-4))
              (when var-5 (setf iflag var-5))))
        (if (< iflag 0)
            (go label300))
       label190
        (dogleg n r lr diag qtf delta wa1 wa2 wa3)
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%)
                    (- (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%)))
            (setf (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%)
                    (+ (f2cl-lib:fref x-%data% (j) ((1 n)) x-%offset%)
                       (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%)))
            (setf (f2cl-lib:fref wa3-%data% (j) ((1 n)) wa3-%offset%)
                    (* (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                       (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%)))
           label200))
        (setf pnorm (enorm n wa3))
        (if (= iter 1)
            (setf delta (f2cl-lib:dmin1 delta pnorm)))
        (setf iflag 1)
        (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
            (funcall fcn n wa2 wa4 fjac ldfjac iflag)
          (declare (ignore var-1 var-2 var-3))
          (when var-0 (setf n var-0))
          (when var-4 (setf ldfjac var-4))
          (when var-5 (setf iflag var-5)))
        (setf nfev (f2cl-lib:int-add nfev 1))
        (if (< iflag 0)
            (go label300))
        (setf fnorm1 (enorm n wa4))
        (setf actred (- one))
        (if (< fnorm1 fnorm)
            (setf actred (- one (expt (/ fnorm1 fnorm) 2))))
        (setf l 1)
        (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                      ((> i n) nil)
          (tagbody
            (setf sum zero)
            (f2cl-lib:fdo (j i (f2cl-lib:int-add j 1))
                          ((> j n) nil)
              (tagbody
                (setf sum
                        (+ sum
                           (* (f2cl-lib:fref r-%data% (l) ((1 lr)) r-%offset%)
                              (f2cl-lib:fref wa1-%data% (j) ((1 n))
                                             wa1-%offset%))))
                (setf l (f2cl-lib:int-add l 1))
               label210))
            (setf (f2cl-lib:fref wa3-%data% (i) ((1 n)) wa3-%offset%)
                    (+ (f2cl-lib:fref qtf-%data% (i) ((1 n)) qtf-%offset%)
                       sum))
           label220))
        (setf temp (enorm n wa3))
        (setf prered zero)
        (if (< temp fnorm)
            (setf prered (- one (expt (/ temp fnorm) 2))))
        (setf ratio zero)
        (if (> prered zero)
            (setf ratio (/ actred prered)))
        (if (>= ratio p1)
            (go label230))
        (setf ncsuc 0)
        (setf ncfail (f2cl-lib:int-add ncfail 1))
        (setf delta (* p5 delta))
        (go label240)
       label230
        (setf ncfail 0)
        (setf ncsuc (f2cl-lib:int-add ncsuc 1))
        (if (or (>= ratio p5) (> ncsuc 1))
            (setf delta (f2cl-lib:dmax1 delta (/ pnorm p5))))
        (if (<= (f2cl-lib:dabs (- ratio one)) p1)
            (setf delta (/ pnorm p5)))
       label240
        (if (< ratio p0001)
            (go label260))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf (f2cl-lib:fref x-%data% (j) ((1 n)) x-%offset%)
                    (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%))
            (setf (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%)
                    (* (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                       (f2cl-lib:fref x-%data% (j) ((1 n)) x-%offset%)))
            (setf (f2cl-lib:fref fvec-%data% (j) ((1 n)) fvec-%offset%)
                    (f2cl-lib:fref wa4-%data% (j) ((1 n)) wa4-%offset%))
           label250))
        (setf xnorm (enorm n wa2))
        (setf fnorm fnorm1)
        (setf iter (f2cl-lib:int-add iter 1))
       label260
        (setf nslow1 (f2cl-lib:int-add nslow1 1))
        (if (>= actred p001)
            (setf nslow1 0))
        (if jeval
            (setf nslow2 (f2cl-lib:int-add nslow2 1)))
        (if (>= actred p1)
            (setf nslow2 0))
        (if (or (<= delta (* xtol xnorm)) (= fnorm zero))
            (setf info 1))
        (if (/= info 0)
            (go label300))
        (if (>= nfev maxfev)
            (setf info 2))
        (if (<= (* p1 (f2cl-lib:dmax1 (* p1 delta) pnorm)) (* epsmch xnorm))
            (setf info 3))
        (if (= nslow2 5)
            (setf info 4))
        (if (= nslow1 10)
            (setf info 5))
        (if (/= info 0)
            (go label300))
        (if (= ncfail 2)
            (go label290))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j n) nil)
          (tagbody
            (setf sum zero)
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i n) nil)
              (tagbody
                (setf sum
                        (+ sum
                           (*
                            (f2cl-lib:fref fjac-%data% (i j) ((1 ldfjac) (1 n))
                                           fjac-%offset%)
                            (f2cl-lib:fref wa4-%data% (i) ((1 n))
                                           wa4-%offset%))))
               label270))
            (setf (f2cl-lib:fref wa2-%data% (j) ((1 n)) wa2-%offset%)
                    (/
                     (- sum
                        (f2cl-lib:fref wa3-%data% (j) ((1 n)) wa3-%offset%))
                     pnorm))
            (setf (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%)
                    (* (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                       (/
                        (*
                         (f2cl-lib:fref diag-%data% (j) ((1 n)) diag-%offset%)
                         (f2cl-lib:fref wa1-%data% (j) ((1 n)) wa1-%offset%))
                        pnorm)))
            (if (>= ratio p0001)
                (setf (f2cl-lib:fref qtf-%data% (j) ((1 n)) qtf-%offset%) sum))
           label280))
        (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7)
            (r1updt n n r lr wa1 wa2 wa3 sing)
          (declare (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-6))
          (setf sing var-7))
        (r1mpyq n n fjac ldfjac wa2 wa3)
        (r1mpyq 1 n qtf 1 wa2 wa3)
        (setf jeval f2cl-lib:%false%)
        (go label180)
       label290
        (go label30)
       label300
        (if (< iflag 0)
            (setf info iflag))
        (setf iflag 0)
        (if (> nprint 0)
            (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
                (funcall fcn n x fvec fjac ldfjac iflag)
              (declare (ignore var-1 var-2 var-3))
              (when var-0 (setf n var-0))
              (when var-4 (setf ldfjac var-4))
              (when var-5 (setf iflag var-5))))
        (go end_label)
       end_label
        (return
         (values nil n nil nil nil ldfjac nil nil nil nil nil nil info nfev
                 njev nil nil nil nil nil nil nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::hybrj fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '(t (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (array double-float (*))
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (double-float)
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (double-float)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (array double-float (*))
                                              (array double-float (*))
                                              (array double-float (*))
                                              (array double-float (*)))
                                            :return-values
                                            '(nil fortran-to-lisp::n nil nil
                                              nil fortran-to-lisp::ldfjac nil
                                              nil nil nil nil nil
                                              fortran-to-lisp::info
                                              fortran-to-lisp::nfev
                                              fortran-to-lisp::njev nil nil nil
                                              nil nil nil nil)
                                            :calls
                                            '(fortran-to-lisp::r1mpyq
                                              fortran-to-lisp::r1updt
                                              fortran-to-lisp::dogleg
                                              fortran-to-lisp::qform
                                              fortran-to-lisp::qrfac
                                              fortran-to-lisp::enorm
                                              fortran-to-lisp::dpmpar))))

