(provide 'init-keybindings)

;; mac keyboard remap
;; (setq mac-command-modifier 'meta)
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(global-set-key "\C-x?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-\M-h" 'backward-kill-word)
(global-set-key [C-left] 'previous-buffer)
(global-set-key [C-right] 'next-buffer)
;; (global-set-key (kbd "C-'") 'other-window)
(global-set-key (kbd "C-'") 'next-multiframe-window)
(global-set-key (kbd "C-M-'") 'previous-multiframe-window)
(global-set-key (kbd "C-]") 'switch-to-buffer)

(global-set-key "\C-x " 'just-one-space)

(global-set-key (kbd "C-x M-l") 'downcase-word)
(global-set-key (kbd "C-x M-u") 'upcase-word)
(global-set-key (kbd "C-x M-;") 'comment-dwim)
(global-set-key (kbd "C-x C-M-w") 'append-next-kill)

(global-set-key "\M-p" '(lambda() (interactive) (move-to-window-line 0)))
(global-set-key "\M-n" '(lambda() (interactive) (move-to-window-line -1)))

;; (setq skeleton-pair t)
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; ;; (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "`") 'skeleton-pair-insert-maybe)
