(asdf:defsystem "<% @var name %>"
  :version "0.1.0"
  :author "<% @var author %>"
  :license "<% @var license %>"
  :depends-on ()
  :components ((:file "<% @var name %>"))
  :description ""
  :in-order-to ((test-op (test-op "<% @var name %>-test"))))
