(provide 'init-keybindings)

;; mac keyboard remap
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
;; (global-set-key (kbd "C-]") 'switch-to-buffer)

(global-set-key "\C-x " 'just-one-space)

(global-set-key "\M-p" '(lambda() (interactive) (move-to-window-line 0)))
(global-set-key "\M-n" '(lambda() (interactive) (move-to-window-line -1)))

(global-set-key (kbd "C-x M-t") 'transpose-words)
(global-set-key (kbd "C-x C-M-t") 'transpose-sexps)
(global-set-key (kbd "M-t")
                (lambda()
                  (interactive)
                  (save-buffer)
                  (compile "make -k")))
(global-set-key (kbd "C-M-t")
                (lambda()
                  (interactive)
                  (shell-command "open *.app")))
