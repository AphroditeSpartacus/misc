(require 'multiple-cursors)

(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m f") 'mc/mark-all-like-this-in-defun)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m n") 'mc/cycle-forward)
(global-set-key (kbd "C-c m p") 'mc/cycle-backward)
(global-set-key (kbd "C-c m u") 'mc/unmark-next-like-this)