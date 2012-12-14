;; 'jedi:setup
;; (setq jedi:setup-keys t)

(add-hook 'python-mode-hook
          (lambda ()
            'jedi:setup
            (setq jedi:get-in-function-call--d t)
            (define-key python-mode-map (kbd "C-;") 'jedi:complete)))
