(provide 'init-auto-complete)

;; (add-to-list 'load-path
;;              (concat plugins-dir "auto-complete/lib/popup"))
;; (add-to-list 'load-path
;;              (concat plugins-dir "auto-complete/lib/fuzzy"))
;; (add-to-list 'load-path
;;              (concat plugins-dir "auto-complete/lib/ert"))
;; (add-to-list 'load-path
;;              (concat plugins-dir "auto-complete"))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (concat plugins-dir "auto-complete/dict"))
;; (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;; (setq ac-auto-start nil)
;; (ac-set-trigger-key (kbd "C-;"))

(add-to-list 'load-path (concat plugins-dir "auto-complete/lib/popup"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/lib/fuzzy"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/lib/ert"))
(add-to-list 'load-path (concat plugins-dir "auto-complete"))
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
;(ac-set-trigger-key "\C-;")
(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "\C-;")

(add-to-list 'ac-dictionary-directories (concat plugins-dir "auto-complete/dict"))
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
