(provide 'init-python-mode)

(add-to-list 'load-path
             (concat plugins-dir "python-mode"))
(setq py-set-complete-keymap-p t)
(require 'python-mode)

(setq py-load-pymacs-p t)
