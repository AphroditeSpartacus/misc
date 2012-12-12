(require 'yasnippet)
(setq yas-snippet-dirs
      `(,(concat init-dir "snippets")))
(yas-global-mode 1)

(setq yas-triggers-in-field t)

;; (define-key yas-minor-mode-map [(tab)] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "M-i") 'yas-expand)

;; (global-set-key (kbd "C-M-i") 'tab-to-tab-stop)
(define-key yas-minor-mode-map (kbd "M-i") 'yas-next-field)
(define-key yas-minor-mode-map (kbd "C-M-i") 'yas-prev-field)
