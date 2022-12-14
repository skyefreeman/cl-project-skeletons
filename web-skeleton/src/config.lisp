(in-package :cl-user)
(defpackage <% @var name %>.config
  (:use :cl)
  (:import-from
   :envy
   :config-env-var
   :defconfig)
  (:export
   :config
   :*application-root*
   :*static-directory*
   :appenv
   :developmentp
   :productionp))
(in-package :<% @var name %>.config)

(setf (config-env-var) "APP_ENV")

(defparameter *application-root*   (asdf:system-source-directory :<% @var name %>))
(defparameter *static-directory*   (merge-pathnames #P"static/" *application-root*))

(defconfig :common
  `(:databases ((:maindb :sqlite3 :database-name ":memory:"))))

(defconfig |development|
  '())

(defconfig |production|
  '())

(defconfig |test|
  '())

(defun config (&optional key)
  (envy:config #.(package-name *package*) key))

(defun appenv ()
  (uiop:getenv (config-env-var #.(package-name *package*))))

(defun developmentp ()
  (string= (appenv) "development"))

(defun productionp ()
  (string= (appenv) "production"))
