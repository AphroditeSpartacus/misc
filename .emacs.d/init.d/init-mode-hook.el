(provide 'init-mode-hook)

(add-hook 'c-mode-hook
	  (lambda ()
            ;; (setq c-basic-offset 4)
            ;; (setq c-default-style "linux")
            ;; (c-set-offset 'substatement-open 0)
            ;; (define-key c-mode-map "\C-h" 'c-electric-backspace)
            (define-key c-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key c-mode-map "\C-\M-e" 'mark-end-of-line)
            ))

(add-hook 'c++-mode-hook
	  (lambda ()
            (c-set-style "stroustrup")
            ;; (setq c-basic-offset 2)
            (c-toggle-auto-hungry-state 1)
            (define-key c++-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key c++-mode-map "\C-\M-e" 'mark-end-of-line)
            ))

(add-hook 'java-mode-hook
	  (lambda ()
            ;; (setq c-basic-offset 2)
            (c-toggle-auto-hungry-state 1)
            (define-key java-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key java-mode-map "\C-\M-e" 'mark-end-of-line)
            ))

(add-hook 'python-mode-hook
	  (lambda ()
            (define-key python-mode-map (kbd "<DEL>") 'py-electric-backspace)
            (define-key python-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key python-mode-map "\C-\M-e" 'mark-end-of-line)
            ))

(add-hook 'w3m-mode-hook
	  (lambda ()
            ;; (define-key w3m-mode-map "\C-j" 'w3m-view-this-url)
            (define-key w3m-mode-map "\M-[" nil)
            (define-key w3m-mode-map "\M-]" nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; syntax-highlighting for Qt
;; ;; (based on work by Arndt Gulbrandsen, Troll Tech)
;; (defun jk/c-mode-common-hook ()
;;   "Set up c-mode and related modes.
;;  Includes support for Qt code (signal, slots and alikes)."
;;   ;; base-style
;;   ;; (c-set-style "stroustrup")
;;   ;; set auto cr mode
;;   ;; (c-toggle-auto-hungry-state 1)

;;   ;; qt keywords and stuff ...
;;   ;; set up indenting correctly for new qt kewords
;;   (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
;;                                  "\\|protected slot\\|private\\|private slot"
;;                                  "\\)\\>")
;;         c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
;;                                  "\\|public slots\\|protected slots\\|private slots"
;;                                  "\\)\\>[ \t]*:"))
;;   (progn
;;     ;; modify the colour of slots to match public, private, etc ...
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
;;     ;; make new font for rest of qt keywords
;;     (make-face 'qt-keywords-face)
;;     ;; (set-face-foreground 'qt-keywords-face "BlueViolet")
;;     ;; from solarized-definitions.el: green color.
;;     (set-face-foreground 'qt-keywords-face "#728a05")
;;     ;; qt keywords
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
;;     ))

;; (add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)

(defun qt/c-mode-common-hook ()
  ;; qt keywords and stuff ...
  ;; set up indenting correctly for new qt kewords
  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
                                 "\\|protected slot\\|private\\|private slot"
                                 "\\)\\>")
        c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
                                 "\\|public slots\\|protected slots\\|private slots"
                                 "\\)\\>[ \t]*:"))
  (progn
    (font-lock-add-keywords 'c++-mode '(("\\<\\(slots\\|signals\\)\\>" . font-lock-keyword-face)))
    (font-lock-add-keywords 'c++-mode '(("\\<Q_OBJECT\\>" . font-lock-type-face)))
    (font-lock-add-keywords 'c++-mode '(("\\<SIGNAL\\|SLOT\\>" . font-lock-type-face)))
    ))

(add-hook 'c-mode-common-hook 'qt/c-mode-common-hook)

;; (defun qt/xx ()
;;   (interactive)
;;   (setq c-C++-access-key "\\<\\(slots\\|signals\\|private\\|protected\\|public\\)\\>[ \t]*[(slots\\|signals)]*[ \t]*:")
;;   (font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-type-face))))
;; (add-hook 'c++-mode-hook 'qt/xx)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
