(provide 'init-expand-region)

(add-to-list 'load-path
             (concat plugins-dir "expand-region"))
(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)
