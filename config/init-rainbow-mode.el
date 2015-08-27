;;;rainbow-mode settings

(require 'rainbow-mode)
(dolist (hook '(css-mode-hook
                scss-mode-hook))
  (add-hook hook (lambda () (rainbow-mode t))))

(provide 'init-rainbow-mode)
