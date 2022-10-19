(in-package :cl-user)
(defpackage moontechsoftware.web
  (:use
   :cl
   :caveman2
   :moontechsoftware.config
   :moontechsoftware.view
   :moontechsoftware.db
   :spinneret
   :datafly
   :sxql)
  (:export :*web*))
(in-package :moontechsoftware.web)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;; View Macros

(defmacro with-page ((&key title description script) &body body)
  `(with-html-string
     (:doctype)
     (:html
      (:head
       (:title ,title)
       (:meta :name "description" :content ,description)
       
       (:meta :name "viewport" :content "width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1, user-scalable=no")

       (:meta :name "mobile-web-app-capable" :content "yes")
       (:meta :name "apple-mobile-web-app-title" :content "")
       (:meta :name "apple-mobile-web-app-capable" :content "yes")

       (:meta :name "og:title" :content ,title)
       (:meta :name "og:description" :content ,description)
       (:meta :name "og:type" :content "website")
       (:meta :name "og:site_name" :content "")
       (:meta :name "og:image" :content "")
       (:meta :name "og:image:width" :content "320")
       (:meta :name "og:image:height" :content "320")
       
       (:meta :name "twitter:card" :content "summary")
       (:meta :name "twitter:title" :content ,title)
       (:meta :name "twitter:description" :content ,description)
       (:meta :name "twitter:image" :content "")
       (:meta :name "twitter:image:alt" :content "")

       (:link :rel "apple-touch-icon" :href "")
       (:link :rel "apple-touch-startup-image" :href "")
       
       (:link :rel "icon" :href "/images/favicon.png")
       
       (:link :href "/css/tailwind.css"
	      :rel "stylesheet"
	      :type "text/css")
       
       (:link :href "/css/main.css"
	      :rel "stylesheet"
	      :type "text/css")
       )
      (:body :id "main"
	     ,@body)

      ;; Custom scripts
      (:script (:raw ,script))
      
      ;; Simple Analytics
      (:script :async :defer :src "https://scripts.simpleanalyticscdn.com/latest.js")
      (:noscript
       (:raw
	"<img src=\"https://queue.simpleanalyticscdn.com/noscript.gif\"
	 alt=""
	 referrerpolicy=\"no-referrer-when-downgrade\" />")))))

;; Views

(defun index-script ()
  (ps:ps
   ((ps:@ console log) "Hello world")
   )
  )

(defun index-view ()
  (with-page (:title "Hello world!"
	      :description "The beginning of a great website."
	      :script (index-script)
	      )
    (:div :class "flex h-screen bg-white"
	  (:div :class "max-w-sm text-black text-center"
		(:h1 :class "" "Hello world!")
		))
    ))

;; Routing rules

(defroute "/" ()
  (index-view))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (with-page (:title "404 Not Found"
	      :description "Resource not found."
	      :script (index-script)
	      )
    (:div :class "flex h-screen bg-white"
	  (:div :class "max-w-sm text-black text-center"
		(:h1 :class "" "Resource not found")
		))
    )
  )
