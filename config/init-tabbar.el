;;tabbar settings

(require 'tabbar)

;;to startup tabbar mode.
(tabbar-mode 1)

;;;tabbar mode key settings.
;;to backward tab.
(global-set-key [(meta j)] 'tabbar-backward-tab)

;;to forward tab.
(global-set-key [(meta k)] 'tabbar-forward-tab)

;;to backward tab group.
(global-set-key [(meta h)] 'tabbar-backward-group)

;;to forward tab group.
(global-set-key [(meta l)] 'tabbar-forward-group)

;;;end the tabbar mode key setting.

;;group setting function.
(defun my-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     ))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;;选项卡颜色设置
;;默认样式
(set-face-attribute 'tabbar-default nil  
                   :background "#1e1e1e"  
                   :foreground "#c8c8c8"  
                   :height 1.0  
                    )  

;;左侧三个按钮样式设置
(set-face-attribute 'tabbar-button nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "#282828")
                    )  

;;当前选项卡样式
(set-face-attribute 'tabbar-selected nil  
                    :inherit 'tabbar-default  
                    :foreground "#c8c8c8"  
                    :background "#464547"
                   :box '(:line-width 2 :color "#569cd6") 
                    :weight 'bold  
                   )  

;;非当前选项卡样式
(set-face-attribute 'tabbar-unselected nil  
                    :inherit 'tabbar-default  
		    :background "#464547"
                   :box '(:line-width 2 :color "#1e1e1e")  
                   ) 



;;;-----------------------------------------------------------------
(provide 'init-tabbar)
