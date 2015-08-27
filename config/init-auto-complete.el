;;;auto complete settings

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'fuzzy)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)

(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;;;---------------------------------
(provide 'init-auto-complete)
