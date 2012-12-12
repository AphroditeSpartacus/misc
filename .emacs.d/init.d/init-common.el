(provide 'init-common)

(setq init-dir "~/.emacs.d/")
(setq plugins-dir (concat init-dir "plugins/"))
(setq themes-dir (concat init-dir "themes/"))

(add-to-list 'exec-path "/usr/local/bin")

(setq frame-title-format "FIGHTING")

(setq inhibit-startup-message t) ;;close startup message
;; (global-hl-line-mode t)
;; (global-linum-mode t)
(setq column-number-mode t)
(setq menu-bar-mode nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
;; (show-paren-mode t)
(transient-mark-mode t)
(global-auto-revert-mode t)             ;auto revert file
(file-name-shadow-mode t)
(setq-default indent-tabs-mode nil)
(setq read-file-name-completion-ignore-case nil)

;; delete-trailing-whitespace when write(save) file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving
(setq backup-directory-alist '(("." . "~/.emacs.d/backup.d"))) ;; the backup files will in the directory: ~/.emacs.d/backup.d

;; process files of same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq display-time-24hr-format t)
(display-time-mode 1) ;; show time
