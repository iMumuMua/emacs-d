;;;rainbow-mode settings

(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'rainbow-mode)
(dolist (hook '(css-mode-hook))
  (add-hook hook (lambda () (rainbow-mode t))))

(provide 'init-rainbow-mode)
