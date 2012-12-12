(provide 'init-el-get)

(add-to-list 'load-path
             (concat init-dir "el-get/el-get"))

(setq el-get-user-package-directory
      (concat init-dir "el-get-init-files"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)
