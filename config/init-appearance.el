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
(defun i-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;;按F11进行全屏切换
(global-set-key [f11] 'i-fullscreen)

;;;全屏转换设置结束----------------------------------------------

;; 字体设置

(defun i-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun i-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun i-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (i-make-font-string
                  (find-if #'i-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'i-font-existsp chinese-fonts)
                            :size chinese-font-size)))
 
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
 
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

(i-set-font
 '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New") 16
 '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))


;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
 
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;;-----------------------------------
(provide 'init-appearance)
