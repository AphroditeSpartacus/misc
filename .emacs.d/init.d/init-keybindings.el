(provide 'init-keybindings)

;; mac keyboard remap
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(global-set-key "\C-x?" 'help-command)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

(define-key key-translation-map (kbd "C-j") (kbd "<RET>"))
(global-set-key (kbd "<RET>") 'newline-and-indent)

(define-key key-translation-map (kbd "C-M-h") (kbd "<M-DEL>"))
(global-set-key (kbd "C-x <M-DEL>") 'mark-defun)

(global-set-key "\M-g" 'goto-line)
(global-set-key [C-left] 'previous-buffer)
(global-set-key [C-right] 'next-buffer)
;; (global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-'") 'other-window)
(global-set-key (kbd "M-[") 'previous-multiframe-window)
(global-set-key (kbd "M-]") 'next-multiframe-window)
(global-set-key (kbd "C-M-'") 'previous-multiframe-window)
;; (global-set-key (kbd "C-]") 'switch-to-buffer)

(global-set-key "\C-x " 'just-one-space)

(global-set-key "\M-p" '(lambda() (interactive) (move-to-window-line 0)))
(global-set-key "\M-n" '(lambda() (interactive) (move-to-window-line -1)))
