(provide 'init-winner-mode)

(winner-mode t)

(global-set-key (kbd "C-c u") 'winner-undo)
(global-set-key (kbd "C-c r") 'winner-redo)
