(provide 'init-modules)

(defun compile-and-run-current-file ()
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be php, perl, python, ruby, javascript, bash, ocaml, java.
File suffix is used to determine what program to run."
  (interactive)
  (let (extention-alist fileStr-alist fname suffix progName cmdStr)
    (setq fname (buffer-file-name))
    (setq basename (file-name-sans-extension (file-name-nondirectory fname)))
    (setq suffix (file-name-extension fname))
    (setq extention-alist ;; a keyed list of file suffix to comand-line program to run
          '(
            ("java" . "javac -d /tmp")
            ;; ("java" . "javac -d /tmp -classpath /Users/Aphrodite/Documents/thinkInJava/src")
	    ("cpp" . "g++ -Wall -o /tmp/a.out")
            ;; ("cpp" . "g++ -Wall -o /tmp/a.out -lglut -lGL -lGLU -lm -I /Users/Aphrodite/program/openGL/src/examples/src/shared -I /usr/include/GL")
	    ("c"   . "gcc -Wall -o /tmp/a.out")
	    ("py"  . "/usr/bin/time python")
            ("hs"  . "ghc -o /tmp/a.out -outputdir /tmp -tmpdir /tmp")
            ("lisp" . "/usr/bin/time sbcl --script")
            ;; ("sh" . "bash")
            )
          )
    (setq fileStr-alist
	  `(
            ("java" . ,(concat " && /usr/bin/time java -classpath /tmp " basename))
            ;; ("java" . ,(concat " && /usr/bin/time java -classpath /Users/Aphrodite/Documents/thinkInJava/src -classpath /tmp " basename))
            ;; ("java" . ,fname)
	    ("cpp" . " && /usr/bin/time /tmp/a.out")
	    ("c"   . " && /usr/bin/time /tmp/a.out")
	    ("py"  . "")
            ("hs"  . " && /usr/bin/time /tmp/a.out")
            ("lisp" . "")
	    )
	  )
    (setq progName (cdr (assoc suffix extention-alist)))
    (setq fileStr (cdr (assoc suffix fileStr-alist)))
    (setq cmdStr (concat progName " \""   fname "\"" fileStr))
    (if progName
	(progn
	  (message "Running...")
	  (async-shell-command cmdStr))
      (message "No recognized program file suffix for this file.")
      )))
(defun compile-and-run-current-file-debug ()
  (interactive)
  (let (extention-alist fileStr-alist fname suffix progName cmdStr)
    (setq extention-alist ;; a keyed list of file suffix to comand-line program to run
          '(
	    ("cpp" . "g++ -DDEBUG -Wall -o /tmp/a.out")
	    ("c"   . "gcc -DDEBUG -Wall -o /tmp/a.out")
	    ("py"  . "/usr/bin/time python")
            ;; ("sh" . "bash")
            )
          )
    (setq fileStr-alist
	  '(
	    ("cpp" . " && /usr/bin/time /tmp/a.out")
	    ("c"   . " && /usr/bin/time /tmp/a.out")
	    ("py"  . "")
	    )
	  )
    (setq fname (buffer-file-name))
    (setq suffix (file-name-extension fname))
    (setq progName (cdr (assoc suffix extention-alist)))
    (setq fileStr (cdr (assoc suffix fileStr-alist)))
    (setq cmdStr (concat progName " \""   fname "\"" fileStr))
    (if progName
	(progn
	  (message "Running...")
	  (async-shell-command cmdStr))
      (message "No recognized program file suffix for this file.")
      )))
(global-set-key "\M-r" 'compile-and-run-current-file)
(global-set-key "\C-\M-r" 'compile-and-run-current-file-debug)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun comment-and-copy()
  (interactive)
  (if mark-active
      (let ((lines (buffer-substring-no-properties (region-beginning) (region-end)))
            (lines-size (- (region-end) (region-beginning))))
        (comment-region (region-beginning) (region-end))
        (insert lines)
        (backward-char lines-size))))
(global-set-key (kbd "C-M-;") 'comment-and-copy)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-whole-line-and-move-end-of-line()
  (interactive)
    (kill-whole-line)
    (move-end-of-line nil))
(global-set-key (kbd "C-M-k") 'kill-whole-line-and-move-end-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))
(global-set-key (kbd "M-C-8") '(lambda () (interactive) (adjust-opacity nil -5)))
(global-set-key (kbd "M-C-9") '(lambda () (interactive) (adjust-opacity nil 5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (fboundp 'ns-toggle-fullscreen)
  (defadvice ns-toggle-fullscreen (after mark-full-screen activate)
    (set-frame-parameter nil
                         'is-full-screen
                         (not (frame-parameter nil 'is-full-screen))))

  ;; Command-Option-f to toggle fullscreen mode
  (global-set-key [f11] 'ns-toggle-fullscreen))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun start-newline-next ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
(global-set-key (kbd "C-M-o") 'start-newline-next)

(defun start-newline-prev ()
  (interactive)
  (forward-line -1)
  (start-newline-next))
(global-set-key (kbd "C-o") 'start-newline-prev)
