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

;; (global-set-key "\M-r" '(lambda() (interactive) (compile-and-run-current-file nil nil)))
;; (global-set-key "\C-\M-r" '(lambda() (interactive) (compile-and-run-current-file t nil)))

(defun compile-and-run (&optional n)
  (interactive "P")
  (let ((testcase
         (if (not n) nil
           (if (= n 1) "/tmp/input-1"
             (if (= n 2) "/tmp/input-2"
               (if (= n 3) "/tmp/input-3"
                 (if (= n 4) "/tmp/input-4"
                   (if (= n 5) "/tmp/input-5"
                     (if (= n 6) "/tmp/input-6"
                       (if (= n 7) "/tmp/input-7"
                         (if (= n 8) "/tmp/input-8"
                           (if (= n 9) "/tmp/input-9"))))))))))))
    (compile-and-run-current-file nil testcase)))
(global-set-key (kbd "M-r") 'compile-and-run)

(defun compile-and-run-debug (&optional n)
  (interactive "P")
  (let ((testcase
         (if (not n) nil
           (if (= n 1) "/tmp/input-1"
             (if (= n 2) "/tmp/input-2"
               (if (= n 3) "/tmp/input-3"
                 (if (= n 4) "/tmp/input-4"
                   (if (= n 5) "/tmp/input-5"
                     (if (= n 6) "/tmp/input-6"
                       (if (= n 7) "/tmp/input-7"
                         (if (= n 8) "/tmp/input-8"
                           (if (= n 9) "/tmp/input-9"))))))))))))
    (compile-and-run-current-file t testcase)))
(global-set-key (kbd "C-M-r") 'compile-and-run-debug)

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
  (let ((distance-from-beginning-of-line
         (- (point) (line-beginning-position))))
    (kill-whole-line)
    (let ((forward-distance (min distance-from-beginning-of-line
                                 (- (line-end-position) (line-beginning-position)))))
      (forward-char forward-distance))))
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

(global-set-key (kbd "C-M-j") 'newline-and-indent)
(global-set-key (kbd "C-j") 'start-newline-next)

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

(defun kill-whole-line-and-move-next-line()
  (interactive)
  (kill-whole-line)
  (start-newline-next))

(global-set-key (kbd "C-x M-k") 'kill-sentence)
(global-set-key (kbd "M-k") 'kill-whole-line-and-move-next-line)

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

(global-set-key (kbd "C-x M-l") 'downcase-word)
(global-set-key (kbd "M-l") 'select-current-line-with-newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun copy-current-line()
  (interactive)
  (if (eq (line-end-position) (point-max))
      (kill-ring-save (line-beginning-position) (+ (line-end-position) 0))
      (kill-ring-save (line-beginning-position) (+ (line-end-position) 1))))

(global-set-key (kbd "C-x C-M-w") 'append-next-kill)
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

(global-set-key (kbd "C-x M-;") 'comment-dwim)
(global-set-key (kbd "M-;") 'comment-uncomment)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun duplicate-selected-lines ()
  (interactive)
  (if mark-active
      (let ((lines (buffer-substring-no-properties (region-beginning) (region-end)))
            (lines-size (- (region-end) (region-beginning))))
        (insert lines))
    (let ((current-line (thing-at-point 'line))
          (start (line-beginning-position))
          (end (line-end-position)))
      (beginning-of-line)
      (insert current-line))))

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

(defun duplicate-lines ()
  (interactive)
  (if mark-active
      (duplicate-selected-lines)
    (duplicate-current-line 1)))

(global-set-key (kbd "C-M-l") 'duplicate-lines)

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

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode
                                     lisp-mode
                                     clojure-mode
                                     scheme-mode
                                     haskell-mode
                                     ruby-mode
                                     rspec-mode
                                     python-mode
                                     c-mode
                                     c++-mode
                                     objc-mode
                                     latex-mode
                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Switch fromm *.<impl> to *.<head> and vice versa
(defun switch-cc-to-h ()
  (interactive)
  (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
    (let ((name (match-string 1 buffer-file-name))
 	  (suffix (match-string 2 buffer-file-name)))
      (cond ((string-match suffix "c\\|cc\\|C\\|cpp")
 	     (cond ((file-exists-p (concat name ".h"))
 		    (find-file (concat name ".h"))
                    )
 		   ((file-exists-p (concat name ".hh"))
 		    (find-file (concat name ".hh"))
                    )
                   ))
 	    ((string-match suffix "h\\|hh")
 	     (cond ((file-exists-p (concat name ".cc"))
 		    (find-file (concat name ".cc"))
                    )
 		   ((file-exists-p (concat name ".C"))
 		    (find-file (concat name ".C"))
                    )
 		   ((file-exists-p (concat name ".cpp"))
 		    (find-file (concat name ".cpp"))
                    )
 		   ((file-exists-p (concat name ".c"))
 		    (find-file (concat name ".c"))
                    )))))))

(global-set-key (kbd "C-]") 'switch-cc-to-h)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key
 (kbd "M-1")
 '(lambda () (interactive) (switch-to-buffer-other-window "1")))

(global-set-key
 (kbd "M-2")
 '(lambda () (interactive) (switch-to-buffer-other-window "2")))

(global-set-key
 (kbd "M-3")
 '(lambda () (interactive) (switch-to-buffer-other-window "3")))

(global-set-key
 (kbd "M-4")
 '(lambda () (interactive) (switch-to-buffer-other-window "4")))

(global-set-key
 (kbd "M-5")
 '(lambda () (interactive) (switch-to-buffer-other-window "5")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun bury-target (target)
  (interactive)
  (let ((target-window (get-buffer-window (get-buffer target)))
        (buffer-window-aux (get-buffer-window)))
    (if (eq target-window buffer-window-aux)
        (setq target-window nil))
    (other-window 1)
    (while (and (not (equal (get-buffer-window) buffer-window-aux))
                (not (equal (get-buffer-window) target-window)))
      (other-window 1))
    (if (equal (get-buffer-window) target-window)
        (bury-buffer))
    (while (not (equal (get-buffer-window) buffer-window-aux))
      (other-window 1))))

;; (setq special-display-buffer-names
;;       `(("*compilation*" . ((name . "*compilation*")
;;                             ,@default-frame-alist
;;                             ;; (left . (- 1))
;;                             ;; (top . 0)))))
;;                             (font . "Menlo-15")))))

(global-set-key (kbd "C-x M-t") 'transpose-words)
(global-set-key (kbd "C-x C-M-t") 'transpose-sexps)

(global-set-key (kbd "M-t")
                (lambda()
                  (interactive)
                  (save-buffer)
                  (compile "make -k")
                  (bury-target "*compilation*")
                  ))

(global-set-key (kbd "C-M-t")
                (lambda()
                  (interactive)
                  (shell-command "open *.app")))

(defun show-compilation-result ()
  (interactive)
  (switch-to-buffer-other-frame "*compilation*"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
