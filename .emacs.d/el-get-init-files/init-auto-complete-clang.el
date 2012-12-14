(require 'auto-complete-clang)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))))
