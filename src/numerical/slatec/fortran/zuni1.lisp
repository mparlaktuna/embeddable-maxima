;;; Compiled by f2cl version:
;;; ("f2cl1.l,v 2bc8b118fd29 2011/12/03 06:01:32 toy $"
;;;  "f2cl2.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl3.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl4.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl5.l,v 2bc8b118fd29 2011/12/03 06:01:32 toy $"
;;;  "f2cl6.l,v 1d5cbacbb977 2008/08/24 00:56:27 rtoy $"
;;;  "macros.l,v fceac530ef0c 2011/11/26 04:02:26 toy $")

;;; Using Lisp SBCL 1.0.55
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "EM-SLATEC")


(let ((zeror 0.0) (zeroi 0.0) (coner 1.0))
  (declare (type (double-float) zeror zeroi coner))
  (defun zuni1 (zr zi fnu kode n yr yi nz nlast fnul tol elim alim)
    (declare (type (array double-float (*)) yi yr)
             (type (f2cl-lib:integer4) nlast nz n kode)
             (type (double-float) alim elim tol fnul fnu zi zr))
    (f2cl-lib:with-multi-array-data
        ((yr double-float yr-%data% yr-%offset%)
         (yi double-float yi-%data% yi-%offset%))
      (prog ((bry (make-array 3 :element-type 'double-float))
             (cwrkr (make-array 16 :element-type 'double-float))
             (cwrki (make-array 16 :element-type 'double-float))
             (cssr (make-array 3 :element-type 'double-float))
             (csrr (make-array 3 :element-type 'double-float))
             (cyr (make-array 2 :element-type 'double-float))
             (cyi (make-array 2 :element-type 'double-float)) (i 0) (iflag 0)
             (init 0) (k 0) (m 0) (nd 0) (nn 0) (nuf 0) (nw 0) (aphi 0.0)
             (ascle 0.0) (crsc 0.0) (cscl 0.0) (c1r 0.0) (c2i 0.0) (c2m 0.0)
             (c2r 0.0) (fn 0.0) (phii 0.0) (phir 0.0) (rast 0.0) (rs1 0.0)
             (rzi 0.0) (rzr 0.0) (sti 0.0) (str 0.0) (sumi 0.0) (sumr 0.0)
             (s1i 0.0) (s1r 0.0) (s2i 0.0) (s2r 0.0) (zeta1i 0.0) (zeta1r 0.0)
             (zeta2i 0.0) (zeta2r 0.0))
        (declare (type (array double-float (2)) cyi cyr)
                 (type (array double-float (16)) cwrkr cwrki)
                 (type (array double-float (3)) cssr csrr bry)
                 (type (double-float) zeta2r zeta2i zeta1r zeta1i s2r s2i s1r
                  s1i sumr sumi str sti rzr rzi rs1 rast phir phii fn c2r c2m
                  c2i c1r cscl crsc ascle aphi)
                 (type (f2cl-lib:integer4) nw nuf nn nd m k init iflag i))
        (setf nz 0)
        (setf nd n)
        (setf nlast 0)
        (setf cscl (/ 1.0 tol))
        (setf crsc tol)
        (setf (f2cl-lib:fref cssr (1) ((1 3))) cscl)
        (setf (f2cl-lib:fref cssr (2) ((1 3))) coner)
        (setf (f2cl-lib:fref cssr (3) ((1 3))) crsc)
        (setf (f2cl-lib:fref csrr (1) ((1 3))) crsc)
        (setf (f2cl-lib:fref csrr (2) ((1 3))) coner)
        (setf (f2cl-lib:fref csrr (3) ((1 3))) cscl)
        (setf (f2cl-lib:fref bry (1) ((1 3)))
                (/ (* 1000.0 (f2cl-lib:d1mach 1)) tol))
        (setf fn (max fnu 1.0))
        (setf init 0)
        (multiple-value-bind
            (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9 var-10
             var-11 var-12 var-13 var-14 var-15 var-16)
            (zunik zr zi fn 1 1 tol init phir phii zeta1r zeta1i zeta2r zeta2i
             sumr sumi cwrkr cwrki)
          (declare (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-15 var-16))
          (setf init var-6)
          (setf phir var-7)
          (setf phii var-8)
          (setf zeta1r var-9)
          (setf zeta1i var-10)
          (setf zeta2r var-11)
          (setf zeta2i var-12)
          (setf sumr var-13)
          (setf sumi var-14))
        (if (= kode 1)
            (go label10))
        (setf str (+ zr zeta2r))
        (setf sti (+ zi zeta2i))
        (setf rast (coerce (realpart (/ fn (zabs str sti))) 'double-float))
        (setf str (* str rast rast))
        (setf sti (* (- sti) rast rast))
        (setf s1r (- str zeta1r))
        (setf s1i (- sti zeta1i))
        (go label20)
       label10
        (setf s1r (- zeta2r zeta1r))
        (setf s1i (- zeta2i zeta1i))
       label20
        (setf rs1 s1r)
        (if (> (abs rs1) elim)
            (go label130))
       label30
        (setf nn (min (the f2cl-lib:integer4 2) (the f2cl-lib:integer4 nd)))
        (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                      ((> i nn) nil)
          (tagbody
            (setf fn (+ fnu (f2cl-lib:int-sub nd i)))
            (setf init 0)
            (multiple-value-bind
                (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9
                 var-10 var-11 var-12 var-13 var-14 var-15 var-16)
                (zunik zr zi fn 1 0 tol init phir phii zeta1r zeta1i zeta2r
                 zeta2i sumr sumi cwrkr cwrki)
              (declare
               (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-15 var-16))
              (setf init var-6)
              (setf phir var-7)
              (setf phii var-8)
              (setf zeta1r var-9)
              (setf zeta1i var-10)
              (setf zeta2r var-11)
              (setf zeta2i var-12)
              (setf sumr var-13)
              (setf sumi var-14))
            (if (= kode 1)
                (go label40))
            (setf str (+ zr zeta2r))
            (setf sti (+ zi zeta2i))
            (setf rast (coerce (realpart (/ fn (zabs str sti))) 'double-float))
            (setf str (* str rast rast))
            (setf sti (* (- sti) rast rast))
            (setf s1r (- str zeta1r))
            (setf s1i (+ (- sti zeta1i) zi))
            (go label50)
           label40
            (setf s1r (- zeta2r zeta1r))
            (setf s1i (- zeta2i zeta1i))
           label50
            (setf rs1 s1r)
            (if (> (abs rs1) elim)
                (go label110))
            (if (= i 1)
                (setf iflag 2))
            (if (< (abs rs1) alim)
                (go label60))
            (setf aphi (coerce (realpart (zabs phir phii)) 'double-float))
            (setf rs1 (+ rs1 (f2cl-lib:flog aphi)))
            (if (> (abs rs1) elim)
                (go label110))
            (if (= i 1)
                (setf iflag 1))
            (if (< rs1 0.0)
                (go label60))
            (if (= i 1)
                (setf iflag 3))
           label60
            (setf s2r (- (* phir sumr) (* phii sumi)))
            (setf s2i (+ (* phir sumi) (* phii sumr)))
            (setf str (* (exp s1r) (f2cl-lib:fref cssr (iflag) ((1 3)))))
            (setf s1r (* str (cos s1i)))
            (setf s1i (* str (sin s1i)))
            (setf str (- (* s2r s1r) (* s2i s1i)))
            (setf s2i (+ (* s2r s1i) (* s2i s1r)))
            (setf s2r str)
            (if (/= iflag 1)
                (go label70))
            (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
                (zuchk s2r s2i nw (f2cl-lib:fref bry (1) ((1 3))) tol)
              (declare (ignore var-0 var-1 var-3 var-4))
              (setf nw var-2))
            (if (/= nw 0)
                (go label110))
           label70
            (setf (f2cl-lib:fref cyr (i) ((1 2))) s2r)
            (setf (f2cl-lib:fref cyi (i) ((1 2))) s2i)
            (setf m (f2cl-lib:int-add (f2cl-lib:int-sub nd i) 1))
            (setf (f2cl-lib:fref yr-%data% (m) ((1 n)) yr-%offset%)
                    (* s2r (f2cl-lib:fref csrr (iflag) ((1 3)))))
            (setf (f2cl-lib:fref yi-%data% (m) ((1 n)) yi-%offset%)
                    (* s2i (f2cl-lib:fref csrr (iflag) ((1 3)))))
           label80))
        (if (<= nd 2)
            (go label100))
        (setf rast (coerce (realpart (/ 1.0 (zabs zr zi))) 'double-float))
        (setf str (* zr rast))
        (setf sti (* (- zi) rast))
        (setf rzr (* (+ str str) rast))
        (setf rzi (* (+ sti sti) rast))
        (setf (f2cl-lib:fref bry (2) ((1 3)))
                (/ 1.0 (f2cl-lib:fref bry (1) ((1 3)))))
        (setf (f2cl-lib:fref bry (3) ((1 3))) (f2cl-lib:d1mach 2))
        (setf s1r (f2cl-lib:fref cyr (1) ((1 2))))
        (setf s1i (f2cl-lib:fref cyi (1) ((1 2))))
        (setf s2r (f2cl-lib:fref cyr (2) ((1 2))))
        (setf s2i (f2cl-lib:fref cyi (2) ((1 2))))
        (setf c1r (f2cl-lib:fref csrr (iflag) ((1 3))))
        (setf ascle (f2cl-lib:fref bry (iflag) ((1 3))))
        (setf k (f2cl-lib:int-sub nd 2))
        (setf fn (coerce (the f2cl-lib:integer4 k) 'double-float))
        (f2cl-lib:fdo (i 3 (f2cl-lib:int-add i 1))
                      ((> i nd) nil)
          (tagbody
            (setf c2r s2r)
            (setf c2i s2i)
            (setf s2r (+ s1r (* (+ fnu fn) (- (* rzr c2r) (* rzi c2i)))))
            (setf s2i (+ s1i (* (+ fnu fn) (+ (* rzr c2i) (* rzi c2r)))))
            (setf s1r c2r)
            (setf s1i c2i)
            (setf c2r (* s2r c1r))
            (setf c2i (* s2i c1r))
            (setf (f2cl-lib:fref yr-%data% (k) ((1 n)) yr-%offset%) c2r)
            (setf (f2cl-lib:fref yi-%data% (k) ((1 n)) yi-%offset%) c2i)
            (setf k (f2cl-lib:int-sub k 1))
            (setf fn (- fn 1.0))
            (if (>= iflag 3)
                (go label90))
            (setf str (abs c2r))
            (setf sti (abs c2i))
            (setf c2m (max str sti))
            (if (<= c2m ascle)
                (go label90))
            (setf iflag (f2cl-lib:int-add iflag 1))
            (setf ascle (f2cl-lib:fref bry (iflag) ((1 3))))
            (setf s1r (* s1r c1r))
            (setf s1i (* s1i c1r))
            (setf s2r c2r)
            (setf s2i c2i)
            (setf s1r (* s1r (f2cl-lib:fref cssr (iflag) ((1 3)))))
            (setf s1i (* s1i (f2cl-lib:fref cssr (iflag) ((1 3)))))
            (setf s2r (* s2r (f2cl-lib:fref cssr (iflag) ((1 3)))))
            (setf s2i (* s2i (f2cl-lib:fref cssr (iflag) ((1 3)))))
            (setf c1r (f2cl-lib:fref csrr (iflag) ((1 3))))
           label90))
       label100
        (go end_label)
       label110
        (if (> rs1 0.0)
            (go label120))
        (setf (f2cl-lib:fref yr-%data% (nd) ((1 n)) yr-%offset%) zeror)
        (setf (f2cl-lib:fref yi-%data% (nd) ((1 n)) yi-%offset%) zeroi)
        (setf nz (f2cl-lib:int-add nz 1))
        (setf nd (f2cl-lib:int-sub nd 1))
        (if (= nd 0)
            (go label100))
        (multiple-value-bind
            (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9 var-10
             var-11)
            (zuoik zr zi fnu kode 1 nd yr yi nuf tol elim alim)
          (declare
           (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-9 var-10
            var-11))
          (setf nuf var-8))
        (if (< nuf 0)
            (go label120))
        (setf nd (f2cl-lib:int-sub nd nuf))
        (setf nz (f2cl-lib:int-add nz nuf))
        (if (= nd 0)
            (go label100))
        (setf fn (+ fnu (f2cl-lib:int-sub nd 1)))
        (if (>= fn fnul)
            (go label30))
        (setf nlast nd)
        (go end_label)
       label120
        (setf nz -1)
        (go end_label)
       label130
        (if (> rs1 0.0)
            (go label120))
        (setf nz n)
        (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                      ((> i n) nil)
          (tagbody
            (setf (f2cl-lib:fref yr-%data% (i) ((1 n)) yr-%offset%) zeror)
            (setf (f2cl-lib:fref yi-%data% (i) ((1 n)) yi-%offset%) zeroi)
           label140))
        (go end_label)
       end_label
        (return
         (values nil nil nil nil nil nil nil nz nlast nil nil nil nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::zuni1 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types
                                            '((double-float) (double-float)
                                              (double-float)
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (array double-float (*))
                                              (array double-float (*))
                                              (fortran-to-lisp::integer4)
                                              (fortran-to-lisp::integer4)
                                              (double-float) (double-float)
                                              (double-float) (double-float))
                                            :return-values
                                            '(nil nil nil nil nil nil nil
                                              fortran-to-lisp::nz
                                              fortran-to-lisp::nlast nil nil
                                              nil nil)
                                            :calls
                                            '(fortran-to-lisp::zuoik
                                              fortran-to-lisp::zuchk
                                              fortran-to-lisp::zabs
                                              fortran-to-lisp::zunik
                                              fortran-to-lisp::d1mach))))

