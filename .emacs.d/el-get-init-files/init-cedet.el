(setq  semantic-default-submodes
       '(
         global-semanticdb-minor-mode
         global-semantic-mru-bookmark-mode
         global-semantic-highlight-func-mode
         ;; global-semantic-stickyfunc-mode
         global-semantic-idle-local-symbol-highlight-mode
         ;; global-semantic-idle-scheduler-mode
         ;; global-semantic-idle-completions-mode
         ;; global-semantic-idle-summary-mode
         ))

(semantic-mode t)
(require 'semantic/ia)
;; (require 'semantic/idle)
(require 'semantic/bovine/gcc)
;; (require 'semantic/bovine/clang)
(semantic-gcc-setup)

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

(setq qt4-base-dir "/usr/local/Cellar/qt/4.8.4/include/")
(semantic-add-system-include qt4-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

(defun my-cedet-hook ()
  ;; (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  ;; (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  ;; (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  ;; (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
  (local-set-key (kbd "C-c , d") 'semantic-ia-fast-jump))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
