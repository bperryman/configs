;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General configuration
(setq make-backup-files nil)
;; optional setting of a font
(when (display-graphic-p)
  ; (set-face-attribute 'default nil :font "Consolas-14")
  (set-face-attribute 'default nil :font "Monaco-12")
  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 80))
  (set-frame-width (selected-frame) 80)
  (set-frame-height (selected-frame) 45))

(setq column-number-mode t)
(setq mouse-wheel-follow-mouse t)
(setq standard-indent 2)
(transient-mark-mode 1)
; (setq visible-bell t)
(setq show-paren-face 'modeline)
(setq global-font-lock-mode t)
(setq global-auto-revert-mode t)
(setq-default tab-width 4)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))


;;Load package-install sources
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(load "~/.emacs.d/go-setup")
(load "~/.emacs.d/slime-setup")
