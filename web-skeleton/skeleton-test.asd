(defsystem "moontechsoftware-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Skye Freeman"
  :license ""
  :depends-on ("moontechsoftware"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "moontechsoftware"))))
  :description "Test system for moontechsoftware"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
