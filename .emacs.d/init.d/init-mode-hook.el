(provide 'init-mode-hook)

;; (add-to-list 'load-path "/Users/Aphrodite/.emacs.d/plugins/autopair")
;; (require 'autopair)
;; (autopair-global-mode)

;; (defun my-common-mode-auto-pair ()
;;   (interactive)
;;   (make-local-variable 'skeleton-pair-alist)
;;   (setq skeleton-pair-alist '(
;;                               ;; (? ? _ "''")
;;                               ;; (? ? _ """")
;;                               ;; (? ? _ "()")
;;                               ;; (? ? _ "[]")
;;                               (?{ \n > _ \n ?} >)))
;;   (setq skeleton-pair t)
;;   ;; (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;   ;; (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;;   ;; (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;;   ;; (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "{") 'skeleton-pair-insert-maybe))

(c-set-offset 'substatement-open 0)

(add-hook 'c-mode-hook
	  (lambda ()
            ;; (setq c-basic-offset 4)
            ;; (my-common-mode-auto-pair)
            (c-toggle-auto-hungry-state 1)
            ;; (setq c-default-style "linux")
            (define-key c-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key c-mode-map "\C-\M-e" 'mark-end-of-line)
            (define-key c-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'c++-mode-hook
	  (lambda ()
            ;; (setq c-basic-offset 4)
            ;; (my-common-mode-auto-pair)
            (c-toggle-auto-hungry-state 1)
            ;; (setq c-default-style "linux")
            (define-key c++-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key c++-mode-map "\C-\M-e" 'mark-end-of-line)
            (define-key c++-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'java-mode-hook
	  (lambda ()
            (setq c-basic-offset 2)
            ;; (my-common-mode-auto-pair)
            (c-toggle-auto-hungry-state 1)
            ;; (define-key java-mode-map "\C-h" 'c-electric-backspace)
            (define-key java-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key java-mode-map "\C-\M-e" 'mark-end-of-line)
            (define-key java-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'python-mode-hook
	  (lambda ()
            (define-key python-mode-map "\C-\M-a" 'mark-beginning-of-line)
            (define-key python-mode-map "\C-\M-e" 'mark-end-of-line)
            (define-key python-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'isearch-mode-hook
	  (lambda ()
            (define-key isearch-mode-map "\C-h" 'isearch-delete-char)
            (define-key isearch-mode-map "\C-j" 'isearch-exit)))

(add-hook 'Info-mode-hook
	  (lambda ()
            (define-key Info-mode-map "\C-j" 'Info-follow-nearest-node)))

(add-hook 'w3m-mode-hook
	  (lambda ()
            (define-key w3m-mode-map "\C-j" 'w3m-view-this-url)
            (define-key w3m-mode-map "\M-[" nil)
            (define-key w3m-mode-map "\M-]" nil)))

(add-hook 'dired-mode-hook
	  (lambda ()
            (define-key dired-mode-map "\C-j" 'dired-find-file)))

(add-hook 'help-mode-hook
	  (lambda ()
            (define-key help-mode-map "\C-j" 'push-button)))

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
;;     (set-face-foreground 'qt-keywords-face "BlueViolet")
;;     ;; qt keywords
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
;;     (font-lock-add-keywords 'c++-mode
;;                             '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
;;     ))

;; (add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
