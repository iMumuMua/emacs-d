;;;编辑习惯设置

;;关闭自动存档
(setq auto-save-default nil)

;;关闭自动备份
(setq-default make-backup-files nil)

;;默认编码
(prefer-coding-system 'utf-8)

;;;tab与缩进设置-------------------------------------------

;;回车并缩进
(global-set-key (kbd "RET") 'newline-and-indent)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq default-tab-width 2)
(setq css-indent-offset 2)

;;;-------------------------------------------------------

;;;------------------------------------------
(provide 'init-habit)
