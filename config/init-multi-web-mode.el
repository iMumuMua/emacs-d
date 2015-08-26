;;multi-web-mode settings

(require 'php-mode)

(require 'web-mode)

(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)

;;0.不补全;1.输入</补全;2.输入完>补全</>;
(setq web-mode-tag-auto-close-style 2)

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)


(require 'multi-web-mode)
(setq mweb-default-major-mode 'web-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (web-mode "<script[^>]*>" "</script>")
                  (web-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;;---------------------------------------
(provide 'init-multi-web-mode)
