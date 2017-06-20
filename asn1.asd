(defsystem "asn1"
  :class :package-inferred-system
  :version "0.1.0"
  :author "Eitaro Fukamachi"
  :license "BSD 2-Clause"
  :description "ASN.1 decoder"
  :depends-on ("asn1/main"))

(register-system-packages "optima" '(#:optima.core))
