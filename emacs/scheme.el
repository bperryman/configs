;; Further details here:
;; https://www.travishinkelman.com/posts/getting-started-with-chez-scheme-and-emacs.html

(defvar *scheme-packages*
  '(geiser-chez)
  "My packages!")

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package *scheme-packages*)
  (unless (package-installed-p package)
    (package-install package)))

; (setenv "PATH" (concat (getenv "PATH") "/Users/barry/opt/chez/bin"))

(add-to-list 'exec-path "/Users/barry/opt/chez/bin")

(setenv "CHEZSCHEMELIBDIRS" "/Users/barry/scheme/lib:")
(setenv "CHEZSCHEMELIBEXTS" ".sc::.so:")
