(provide 'init-jedi)

(add-to-list 'load-path
             (concat plugins-dir "jedi"))
(autoload 'jedi:setup "jedi" nil t)

(add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)

(setq jedi:setup-keys t)
