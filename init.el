;;;emacs设置
;;;作者:iMumu<imumu@foxmail.com>

(add-to-list 'load-path "~/.emacs.d/config/")
(add-to-list 'load-path "~/.emacs.d/plugins/")

;;五笔输入法,内置于emacs
;(require 'init-wubi)

;;混合模式设置，包含web-mode和php-mode
(require 'init-multi-web-mode)

;;rainbow-mode,在css中的颜色代码可以显示颜色
(require 'init-rainbow-mode)

;;tabbar,强大的选项卡插件
(require 'init-tabbar)

;;外观设置
(require 'init-appearance)

;;快捷键设置
(require 'init-key)

;;编辑习惯设置
(require 'init-habit)

;;auto-complete
(require 'init-auto-complete)

;;颜色设置
(require 'init-color)

;;smex
(require 'init-smex)

;;coffee-mode
(require 'init-coffee)

;;neotree
(require 'init-neotree)

;;jade stylus
(require 'init-jade)

;;scss
(require 'init-scss)
