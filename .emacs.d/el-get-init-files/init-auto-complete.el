(require 'auto-complete-config)

(setq ac-auto-start nil)
(global-auto-complete-mode t)

;; (define-key ac-completing-map "\C-n" 'ac-next)
;; (define-key ac-completing-map "\C-p" 'ac-previous)

(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
