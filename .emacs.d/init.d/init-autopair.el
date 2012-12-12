(provide 'init-autopair)

(add-to-list 'load-path
             (concat plugins-dir "autopair"))
(require 'autopair)
(autopair-global-mode)
(setq autopair-blink nil)
