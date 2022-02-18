(setf (logical-pathname-translations "ql")
	  `(("ql:**;*.*"
		 ,(merge-pathnames "quicklisp/**/*.*"
						   (user-homedir-pathname)))))

(setf (logical-pathname-translations "clog")
	  `(("clog:**;*.*"
	     ,(merge-pathnames "src/lisplib/clog/**/*.*"
		 				   (user-homedir-pathname)))))
