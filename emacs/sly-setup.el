(defvar *lisp-packages*
  '(paredit sly)
  "My packages!")

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package *lisp-packages*)
  (unless (package-installed-p package)
    (package-install package)))

;;;; Setup for sly
; (setq inferior-lisp-program "/home/pi/opt/ccl/scripts/ccl")
(setq sly-lisp-implementations
      '((ccl ("/home/pi/opt/ccl/armcl")
             :coding-system utf-8-unix)
        (sbcl ("/home/pi/opt/sbcl/bin/sbcl")
              :env ("SBCL_HOME=/home/pi/opt/sbcl/lib/sbcl"))))
