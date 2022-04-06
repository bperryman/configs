(defun disble-tabs ()
  (setq indent-tabs-mode nil))

(add-hook 'lisp-mode-hook 'disable-tabs)

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
      '((sbcl ("/home/barry/opt/sbcl/bin/sbcl")
              :env ("SBCL_HOME=/home/barry/opt/sbcl/lib/sbcl"))))


(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
