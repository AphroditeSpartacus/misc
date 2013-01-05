(provide 'init-modules)

(defun compile-and-run-current-file (debug testcase)
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be php, perl, python, ruby, javascript, bash, ocaml, java.
File suffix is used to determine what program to run."
  (interactive)
  (save-buffer)
  (let (extention-alist fileStr-alist fname suffix progName cmdStr)
    (setq fname (buffer-file-name))
    (setq basename (file-name-sans-extension (file-name-nondirectory fname)))
    (setq suffix (file-name-extension fname))
    (setq extention-alist ;; a keyed list of file suffix to comand-line program to run
          (if debug
              '(
                ("cpp" . "g++ -DDEBUG -Wall -o /tmp/a.out")
                ("c"   . "gcc -DDEBUG -Wall -o /tmp/a.out")
                ("py"  . "/usr/bin/time python")
                ("sh" . "bash")
                )
            '(
              ("java" . "javac -d /tmp")
              ("cpp" . "g++ -Wall -o /tmp/a.out")
              ("c"   . "gcc -Wall -o /tmp/a.out")
              ("py"  . "/usr/bin/time python")
              ("hs"  . "ghc -o /tmp/a.out -outputdir /tmp -tmpdir /tmp")
              ("lisp" . "/usr/bin/time sbcl --script")
              ("sh" . "bash")
              ))
          )
    (setq fileStr-alist
          (if (not testcase)
              `(
                ("java" . ,(concat " && /usr/bin/time java -classpath /tmp " basename))
                ("cpp" . " && /usr/bin/time /tmp/a.out")
                ("c"   . " && /usr/bin/time /tmp/a.out")
                ("py"  . "")
                ("hs"  . " && /usr/bin/time /tmp/a.out")
                ("lisp" . "")
                )
            `(
              ("java" . ,(concat " && /usr/bin/time java -classpath /tmp " basename))
              ("cpp" . ,(concat " && /usr/bin/time /tmp/a.out < " testcase))
              ("c"   . " && /usr/bin/time /tmp/a.out")
              ("py"  . "")
              ("hs"  . " && /usr/bin/time /tmp/a.out")
              ("lisp" . "")
              ))
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

(global-set-key "\M-r" '(lambda() (interactive) (compile-and-run-current-file nil nil)))
(global-set-key "\C-\M-r" '(lambda() (interactive) (compile-and-run-current-file t nil)))

(global-set-key "\M-1" '(lambda() (interactive) (compile-and-run-current-file nil "/tmp/1.input")))
(global-set-key (kbd "C-M-1") '(lambda() (interactive) (compile-and-run-current-file t "/tmp/1.input")))

(global-set-key "\M-2" '(lambda() (interactive) (compile-and-run-current-file nil "/tmp/2.input")))
(global-set-key (kbd "C-M-2") '(lambda() (interactive) (compile-and-run-current-file t "/tmp/2.input")))

(global-set-key "\M-3" '(lambda() (interactive) (compile-and-run-current-file nil "/tmp/3.input")))
(global-set-key (kbd "C-M-3") '(lambda() (interactive) (compile-and-run-current-file t "/tmp/3.input")))

(global-set-key "\M-4" '(lambda() (interactive) (compile-and-run-current-file nil "/tmp/4.input")))
(global-set-key (kbd "C-M-4") '(lambda() (interactive) (compile-and-run-current-file t "/tmp/4.input")))

(global-set-key "\M-5" '(lambda() (interactive) (compile-and-run-current-file nil "/tmp/5.input")))
(global-set-key (kbd "C-M-5") '(lambda() (interactive) (compile-and-run-current-file t "/tmp/5.input")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun comment-and-copy()
  (interactive)
  (if mark-active
      (let ((lines (buffer-substring-no-properties (region-beginning) (region-end)))
            (lines-size (- (region-end) (region-beginning))))
        (comment-region (region-beginning) (region-end))
        (insert lines)
        (backward-char lines-size))
    (let ((current-line (thing-at-point 'line))
          (start (line-beginning-position))
          (end (line-end-position)))
      (beginning-of-line)
      (insert current-line)
      (comment-region start end))))

(global-set-key (kbd "C-M-;") 'comment-and-copy)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-whole-line-and-move-indentation-of-line()
  (interactive)
    (kill-whole-line)
    (back-to-indentation))
(global-set-key (kbd "C-M-k") 'kill-whole-line-and-move-indentation-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))
(global-set-key (kbd "C-M-8") '(lambda () (interactive) (adjust-opacity nil -5)))
(global-set-key (kbd "C-M-9") '(lambda () (interactive) (adjust-opacity nil 5)))

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

;; (global-set-key (kbd "C-M-o") 'start-newline-next)
;; (global-set-key (kbd "C-M-j") 'start-newline-next)
(global-set-key (kbd "M-j") 'start-newline-next)

(defun start-newline-prev ()
  (interactive)
  (if (eq (line-beginning-position) (point-min))
      (progn
        (beginning-of-line)
        (open-line 1))
    (progn
      (forward-line -1)
      (start-newline-next))))

(global-set-key (kbd "C-o") 'start-newline-prev)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (let ((start (line-beginning-position))
        (distance (- (line-end-position) (point))))
    (end-of-line)
    (set-mark start)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun select-current-line-with-newline ()
  "Select the current line with newline"
  (interactive)
  (let ((start (line-beginning-position))
        (distance (- (line-end-position) (point))))
    (if (eq (line-end-position) (point-max))
        (end-of-line) ; move to end of line
      (progn
        (next-logical-line) ; move to next line
        (beginning-of-line)))
    (set-mark start)))

(global-set-key (kbd "M-l") 'select-current-line-with-newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun copy-current-line()
  (interactive)
  (if (eq (line-end-position) (point-max))
      (kill-ring-save (line-beginning-position) (+ (line-end-position) 0))
      (kill-ring-save (line-beginning-position) (+ (line-end-position) 1))))

(global-set-key (kbd "C-M-w") 'copy-current-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun is-empty-line ()
  "copy from python-mode.el. Returns t if cursor is at an line with nothing but whitespace-characters, nil otherwise."
  (interactive "p")
  (save-excursion
    (progn
      (beginning-of-line)
      (looking-at "\\s-*$"))))

(defun comment-uncomment ()
  (interactive)
  (if (and (not mark-active) (not (is-empty-line)))
      (let ((start (line-beginning-position))
            (distance (- (line-end-position) (point))))
        (end-of-line)
        (set-mark start)
        (comment-dwim nil)
        (backward-char (min distance (- (line-end-position) (line-beginning-position)))))
    (comment-dwim nil)))

(global-set-key (kbd "M-;") 'comment-uncomment)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))

      ;; now insert as many time as requested
      (while (> n 0)
    	(insert current-line)
    	(decf n))))
  (next-logical-line))

(global-set-key (kbd "C-M-l") 'duplicate-current-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-beginning-or-indentation-of-line ()
  (interactive)
  (let ((current-position (point)))
    (back-to-indentation)
    (if (eq current-position (point))
        (beginning-of-line))))

(global-set-key (kbd "C-a") 'move-beginning-or-indentation-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mark-beginning-of-line ()
  (interactive)
  (set-mark (line-beginning-position)))

;; set key in init-mode-hook.el
;; (global-set-key (kbd "C-M-a") 'mark-beginning-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mark-end-of-line ()
  (interactive)
  (set-mark (line-end-position)))

;; set key in init-mode-hook.el
;; (global-set-key (kbd "C-M-e") 'mark-end-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
