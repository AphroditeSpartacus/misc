(provide 'init-appearance)

(if (display-graphic-p)
    (progn
      ;; (set-frame-font "Monofur-15")
      ;; (set-frame-font "Monaco-15")
      (set-frame-font "Menlo-15")
      ;; (set-cursor-color "orchid")
      ;; (set-cursor-color "LightSteelBlue4")
      (set-cursor-color "SkyBlue4")
      ;; (set-frame-parameter (selected-frame) 'alpha '(95 90))
      ))

;; (add-to-list 'custom-theme-load-path
;;              (concat themes-dir "tomorrow-theme"))
;; (load-theme 'tomorrow t)
;; (load-theme 'tomorrow-night t)

(add-to-list 'custom-theme-load-path
             (concat themes-dir "emacs-color-theme-solarized"))
;; (load-theme 'solarized-light t)
(load-theme 'solarized-dark t)


(split-window-horizontally)
;; (run-with-idle-timer 0.5 nil 'ns-toggle-fullscreen)
(ns-toggle-fullscreen)
