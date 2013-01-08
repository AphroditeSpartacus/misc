(require 'auto-complete-config)

(setq ac-auto-start nil)
(add-to-list 'ac-dictionary-directories (concat el-get-dir "auto-complete/dict"))

(global-auto-complete-mode t)

(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c++-mode-map (kbd "C-;") 'auto-complete)))

;; (define-key ac-completing-map "\C-n" 'ac-next)
;; (define-key ac-completing-map "\C-p" 'ac-previous)

(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-i" 'ac-complete)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
