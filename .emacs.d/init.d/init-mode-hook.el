(provide 'init-mode-hook)

(defun my/c-mode-common-hook ()
  (c-set-style "stroustrup")
  ;; (setq c-basic-offset 2)
  ;; (c-toggle-auto-hungry-state 1)
  ;; (local-set-key (kbd "C-M-a") 'mark-beginning-of-line)
  ;; (local-set-key (kbd "C-M-e") 'mark-end-of-line)
  )

(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)

;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;;             (setq c-basic-offset 4)
;;             ;; (setq c-default-style "linux")
;;             ;; (c-set-offset 'substatement-open 0)
;;             ;; (define-key c-mode-map "\C-h" 'c-electric-backspace)
;;             (define-key c-mode-map "\C-\M-a" 'mark-beginning-of-line)
;;             (define-key c-mode-map "\C-\M-e" 'mark-end-of-line)
;;             ))

;; (add-hook 'c++-mode-hook
;; 	  (lambda ()
;;             (c-set-style "stroustrup")
;;             ;; (setq c-basic-offset 2)
;;             (c-toggle-auto-hungry-state 1)
;;             (define-key c++-mode-map "\C-\M-a" 'mark-beginning-of-line)
;;             (define-key c++-mode-map "\C-\M-e" 'mark-end-of-line)
;;             ))

(add-hook 'python-mode-hook
	  (lambda ()
            (define-key python-mode-map (kbd "<DEL>") 'py-electric-backspace)
            ))

(add-hook 'w3m-mode-hook
	  (lambda ()
            ;; (define-key w3m-mode-map "\C-j" 'w3m-view-this-url)
            (define-key w3m-mode-map "\M-[" nil)
            (define-key w3m-mode-map "\M-]" nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
