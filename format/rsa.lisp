(defpackage #:asn1/format/rsa
  (:use #:cl
        #:asn1/format/public-key)
  (:import-from #:asn1/decode
                #:decode)
  (:import-from #:trivia
                #:defpattern
                #:access)
  (:export #:rsa-public-key
           #:rsa-public-key-info
           #:rsa-private-key))
(in-package #:asn1/format/rsa)

(defpattern rsa-public-key-info (modulus public-exponent)
  `(list
     (subject-public-key-info
       (algorithm-identifier #(1 2 840 113549 1 1 1) '(:null))
       (subject-public-key (rsa-public-key ,modulus ,public-exponent)))))

(defpattern rsa-public-key (modulus public-exponent)
  `(access #'asn1:decode
           (list (list :sequence
                       (cons :integer ,modulus)
                       (cons :integer ,public-exponent)))))

(defpattern rsa-private-key (&key version modulus public-exponent private-exponent prime1 prime2 exponent1 exponent2 coefficient other-prime-infos)
  `(list (cons :sequence
               (list* (cons :integer ,(or version '(satisfies integerp)))
                      (cons :integer ,(or modulus '(satisfies integerp)))
                      (cons :integer ,(or public-exponent '(satisfies integerp)))
                      (cons :integer ,(or private-exponent '(satisfies integerp)))
                      (cons :integer ,(or prime1 '(satisfies integerp)))
                      (cons :integer ,(or prime2 '(satisfies integerp)))
                      (cons :integer ,(or exponent1 '(satisfies integerp)))
                      (cons :integer ,(or exponent2 '(satisfies integerp)))
                      (cons :integer ,(or coefficient '(satisfies integerp)))
                      (or nil (list ,other-prime-infos))))))
