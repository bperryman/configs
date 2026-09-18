(defvar *sml-packages*
  '(sml-mode smlfmt)
  "My packages!")

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package *sml-packages*)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'exec-path "/Users/barry/opt/poly/bin")
(add-to-list 'exec-path "/usr/local/smlnj/bin")
(setenv "PATH" (concat "/Users/barry/opt/poly/bin:/usr/local/smlnj/bin:" (getenv "PATH")))

(use-package smlfmt
 :hook (sml-mode . smlfmt-format-on-save-mode)
 :bind
 (:map sml-mode-map
   ("C-c r" . smlfmt-format-buffer)))
