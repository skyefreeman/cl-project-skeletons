(defsystem "<% @var name %>-test"
  :author "<% @var author %>"
  :license "<% @var license %>"
  :depends-on ("<% @var name %>"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:test-file "<% @var name %>"))))
  :description "Test system for <% @var name %>"
  :perform (test-op (op c) (symbol-call :fiveam :run-test-system c)))
