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
            (setq c-basic-offset 4)
            ;; (my-common-mode-auto-pair)
            ;; (c-toggle-auto-hungry-state 1)
            ;; (setq c-default-style "linux")
            ;; (define-key c-mode-map "\C-h" 'c-electric-backspace)
            (define-key c-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'c++-mode-hook
	  (lambda ()
            (setq c-basic-offset 4)
            ;; (my-common-mode-auto-pair)
            ;; (c-toggle-auto-hungry-state 1)
            ;; (setq c-default-style "linux")
            ;; (define-key c++-mode-map "\C-h" 'c-electric-backspace)
            (define-key c++-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'java-mode-hook
	  (lambda ()
            (setq c-basic-offset 2)
            ;; (my-common-mode-auto-pair)
            ;; (c-toggle-auto-hungry-state 1)
            ;; (define-key java-mode-map "\C-h" 'c-electric-backspace)
            (define-key java-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'python-mode-hook
	  (lambda ()
            (define-key python-mode-map "\C-\M-h" 'backward-kill-word)))

(add-hook 'isearch-mode-hook
	  (lambda ()
            (define-key isearch-mode-map "\C-h" 'isearch-delete-char)
            (define-key isearch-mode-map "\C-j" 'isearch-exit)))
