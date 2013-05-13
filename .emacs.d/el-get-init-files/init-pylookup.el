;; (defadvice pylookup-lookup-at-point (around iai/search-region)
;;   "if there is an active region, search from it directly"
;;   (if (region-active-p)
;;       (progn
;;         (let ((beg (region-beginning))
;;               (end (region-end)))
;;           (deactivate-mark)
;;           (pylookup-lookup-at-point)
;;           (yank (buffer-substring-no-properties beg end))))
;;     ad-do-it))
;; (ad-activate 'pylookup-lookup-at-point)

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "C-c l") 'pylookup-lookup-at-point)))
