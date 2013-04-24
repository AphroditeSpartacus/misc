(require 'auto-complete-clang)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))))

;; Add Qt4 includes to load path if installed
;; ;; (setq qt-dir "/usr/local/Cellar/qt/4.8.3/include/")
(setq qt-dir "/usr/local/Cellar/qt/4.8.4/include/")

;; (when (file-exists-p qt-dir)
;;   (setq ac-clang-flags
;;         (mapcar (lambda (f) (concat "-I" f))
;;                 (directory-files qt-dir t "Qt\\w+"))))

(when (file-exists-p qt-dir)
  (setq ac-clang-flags
        (mapcar (lambda (f) (concat "-I" f))
                (append
                 (directory-files qt-dir t "Qt\\w+")
                 (split-string "")))))
