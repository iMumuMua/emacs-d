;;;smex settings

(require 'smex)

(smex-initialize)
 
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;原来的M-x
(global-set-key (kbd "C-x M-x") 'execute-extended-command)

;;;-----------------------------
(provide 'init-smex)
