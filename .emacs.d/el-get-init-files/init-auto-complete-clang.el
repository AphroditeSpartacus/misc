(require 'auto-complete-clang)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))))

;; Add Qt4 includes to load path if installed

(setq qt-dir "/usr/local/Cellar/qt/4.8.3/include/")

(when (file-exists-p qt-dir)
  (setq ac-clang-flags
        (mapcar (lambda (f) (concat "-I" f))
                (directory-files qt-dir t "Qt\\w+"))))
