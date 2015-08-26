;;;外观设置

;;去掉欢迎界面
(setq inhibit-startup-message t)

;;在左侧显示行号
(global-linum-mode t)

;;隐藏工具栏
(tool-bar-mode 0)

;;隐藏菜单栏
(menu-bar-mode 0)

;;隐藏滚动条
(scroll-bar-mode 0)

;;高亮当前行
(require 'hl-line)
(global-hl-line-mode t)

;;显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;;透明度转换设置----------------------------------------------------

;;透明度转换函数
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

;;设置透明度转换参数
(setq alpha-list '((80 80)     ;第一个值是活动窗口的透明度，第二个是非活动窗口
                   (100 100)   ;同上
                   ))

;;按F12进行透明度转换
(global-set-key [f12] 'loop-alpha)

;;;透明度转换设置结束--------------------------------------------


;;;全屏转换设置-------------------------------------------------

;;全屏函数
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;;按F11进行全屏切换
(global-set-key [f11] 'my-fullscreen)

;;;全屏转换设置结束----------------------------------------------

;;-----------------------------------
(provide 'init-appearance)
