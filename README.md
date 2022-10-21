# cl-project-skeletons

## Overview 

This is a collection of Common Lisp project templates, dependant on the project templating system provided from [cl-project](https://github.com/fukamachi/cl-project) by Eitaro Fukamachi.

These project templates are specific to my own preferences, and might change without warning. They may however serve as a good starting spot for getting set up with alternate project templates, using the cl-project system.

## Usage

* `cl-project-skeletons` depends on cl-project. From your repl, install using QuickLisp:
```common-lisp
;; QuickLisp Installation
(ql:quickload :cl-project)

;; Create a new project, using the default skeleton
(cl-project:make-project #p"/Users/skye/dev/new-best-project/"
	:name "new-best-project"
	:author "Skye Freeman"
	:email "skyefreeman@icloud.com"
	:license "LLGPL")
```

* `cl-project-skeletons` is a collection of project templates, all that is needed is the repository in your filesystem:
```bash
git clone git@github.com:skyefreeman/cl-project-templates.git
```

* Changing the active project skeleton:
```
;; Change *skeleton-directory* to a new location
(setf cl-project:*skeleton-directory* #p"/Users/skye/dev/cl-project-skeletons/web-skeleton/")

;; Create a new project as usual, which will use the new value for *skeleton-directory*
(cl-project:make-project #p"/Users/skye/dev/new-best-project/"
	:name "new-best-project"
	:author "Skye Freeman"
	:email "skyefreeman@icloud.com"
	:license "LLGPL")	
```

## Skeleton Library

### web-skeleton

A web server, based on [Caveman2](https://github.com/fukamachi/caveman) but with some changes and additions from the default settings:
- Uses [Spinneret](https://github.com/ruricolist/spinneret) for HTML generation.
- Uses [Parenscript](https://gitlab.common-lisp.net/parenscript/parenscript) for Javascript generation.
- Provides a makefile, containing some nice development and deployment facilities.
- Provides a run-prod.sh script, which nicely encapsulates server startup (mainly used in a production environment by systemctl).
- Uses [TailwindCSS](https://tailwindcss.com) for CSS generation (`make install` to initialize Tailwind within the project). Currently defaults to TailwindCSS v3.1.8.
- Uses [browser-sync](https://browsersync.io) as a filewatcher for reloading the browser (`make develop` to both `browser-sync` and `tailwindcss` css generation during development).

## Author

* Skye Freeman, with full credit to Eitaro Fukamachi for creating and maintaining [cl-project](https://github.com/fukamachi/cl-project).

## Copyright

Copyright (c) 2022 Skye Freeman

## License

Licensed under the LLGPL License.
