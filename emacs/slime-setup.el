(defvar *lisp-packages*
  '(paredit slime)
  "My packages!")

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package *lisp-packages*)
  (unless (package-installed-p package)
    (package-install package)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paredit
; (add-to-list 'load-path "~/elisp/paredit/")
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Slime configuration
; (add-to-list 'load-path "~/elisp/slime/")
(set-language-environment "utf-8")

(setq slime-lisp-implementations
      '((sbcl ("~/opt/sbcl/bin/sbcl")
	      :coding-system utf-8-unix
	      :env ("SBCL_HOME=/Users/barry/opt/sbcl/lib/sbcl"))
	(ccl ("~/opt/ccl/scripts/ccl" "-K" "utf-8")
	     :coding-system utf-8-unix
	     :env ("CCL_DEFAULT_DIRECTORY=/Users/barry/opt/ccl"))))

(require 'slime)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))
