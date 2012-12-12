(add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)
(global-set-key (kbd "C-;") 'jedi:complete)
