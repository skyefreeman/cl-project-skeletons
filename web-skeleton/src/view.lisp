(in-package :cl-user)
(defpackage moontechsoftware.view
  (:use :cl)
  (:import-from
   :moontechsoftware.config)

  (:import-from
   :caveman2
   :*response*
   :response-headers)
  
  (:import-from
   :datafly
   :encode-json)
  
  (:export
   :render-plain-text
   :render-json
   :render-html)
  )
(in-package :moontechsoftware.view)

(defun render-html (string)
  (setf (getf (response-headers *response*) :content-type) "text/html")
  string)

(defun render-json (object)
  (setf (getf (response-headers *response*) :content-type) "application/json")
  (encode-json object))

(defun render-plain-text (text)
  (setf (getf (response-headers *response*) :content-type) "text/*")
  text)
