;;;chinese-wubi input method settings

(add-to-list 'load-path "~/.emacs.d/plugins/wubi")
(require 'wubi)

(wubi-load-local-phrases)

(register-input-method
 "chinese-wubi" "utf-8" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

(set-language-environment 'utf-8)

(setq default-input-method "chinese-wubi")

(provide 'init-wubi)
