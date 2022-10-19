(in-package :cl-user)

(defpackage <% @var name %>.view
  (:use :cl)
  (:import-from
   :<% @var name %>.config)

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
   :render-html))

(in-package :<% @var name %>.view)

(defun render-html (string)
  (setf (getf (response-headers *response*) :content-type) "text/html")
  string)

(defun render-json (object)
  (setf (getf (response-headers *response*) :content-type) "application/json")
  (encode-json object))

(defun render-plain-text (text)
  (setf (getf (response-headers *response*) :content-type) "text/*")
  text)
