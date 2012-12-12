(provide 'init-yasnippet)

(add-to-list 'load-path
             (concat plugins-dir "yasnippet"))
(require 'yasnippet)
(setq yas-snippet-dirs
      `(,(concat init-dir "snippets")))
(yas-global-mode 1)

