(defpackage #:asn1/format/public-key
  (:use #:cl)
  (:import-from #:trivia
                #:defpattern)
  (:export #:subject-public-key-info
           #:algorithm-identifier
           #:subject-public-key))
(in-package #:asn1/format/public-key)

(defpattern subject-public-key-info (algorithm-identifier subject-public-key)
  `(list :sequence ,algorithm-identifier ,subject-public-key))

(defpattern algorithm-identifier (algorithm parameters)
  `(list :sequence
         (cons :object-identifier ,algorithm)
         ,parameters))

(defpattern subject-public-key (key)
  `(cons :bit-string ,key))
