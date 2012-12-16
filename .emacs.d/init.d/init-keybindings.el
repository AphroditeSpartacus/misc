(provide 'init-keybindings)

;; mac keyboard remap
(setq mac-command-modifier 'meta)

(global-set-key "\C-x?" 'help-command)
(global-set-key "\C-h" 'backward-delete-char)
;; (global-set-key "\C-h" 'autopair-backspace)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-\M-h" 'backward-kill-word)
(global-set-key [C-left] 'previous-buffer)
(global-set-key [C-right] 'next-buffer)
;; (global-set-key (kbd "C-'") 'switch-to-buffer)
(global-set-key (kbd "C-'") 'other-window)
(global-set-key "\M-[" 'previous-multiframe-window)
(global-set-key "\M-]" 'next-multiframe-window)

(global-set-key "\C-x " 'just-one-space)

(global-set-key "\M-p" '(lambda() (interactive) (move-to-window-line 0)))
(global-set-key "\M-n" '(lambda() (interactive) (move-to-window-line -1)))
