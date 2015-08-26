;;;编辑习惯设置

;;关闭自动存档
(setq auto-save-default nil)

;;关闭自动备份
(setq-default make-backup-files nil)

;;;tab与缩进设置-------------------------------------------

;;回车并缩进
(global-set-key (kbd "RET") 'newline-and-indent)

;;;-------------------------------------------------------

;;;------------------------------------------
(provide 'init-habit)
