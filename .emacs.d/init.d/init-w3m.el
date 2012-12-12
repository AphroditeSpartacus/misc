(provide 'init-w3m)

(setq w3m-command "/usr/local/bin/w3m")

(add-to-list 'load-path
             (concat plugins-dir "w3m"))
(require 'w3m-load)

;; (setq w3m-home-page "file:///Users/Aphrodite/program/acm/topcoder/sources/a.html")
