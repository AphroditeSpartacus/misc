;; (setq w3m-home-page "file:///Users/Aphrodite/program/acm/topcoder/sources/a.html")
(setq w3m-home-page "file:///Users/Aphrodite/program/arena/topcoder/src/mock.html")

;; from LazyCatTheme
(custom-set-faces
 '(w3m-anchor                           ;未访问的标题
   ((((class color) (background dark))
     (:foreground "DodgerBlue2"
                  :underline t))))
 '(w3m-arrived-anchor                   ;已访问的标题
   ((((class color) (background dark))
     (:foreground "Purple4"
                  :underline t))))
 '(w3m-bold                             ;高亮光键字
   ((t (:foreground "Green3"
                    :weight bold))))
 '(w3m-current-anchor                   ;当前标题
   ((t (:box (:line-width -1
                          :color "Grey30")
             :underline t))))
 '(w3m-form                             ;表格
   ((((class color) (background dark))
     (:foreground "Red"
                  :box nil
                  :underline "DarkRed"
                  ))))
 '(w3m-form-button                      ;表格按钮
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "LawnGreen"
                  :box (:line-width -1
                                    :color "#014500"
                                    :style released-button)))))
 '(w3m-form-button-mouse                ;表格按钮鼠标经过
   ((((type x w32 mac) (class color))
     (:background "Black"
                  :foreground "Red"
                  :box (:line-width -1
                                    :color "Grey30"
                                    :style released-button)))))
 '(w3m-form-button-pressed              ;表格按钮鼠标按下
   ((((type x w32 mac) (class color))
     (:background "Black"
                  :foreground "DarkRed"
                  :box (:line-width -1
                                    :color "Grey60"
                                    :style pressed-button)))))
 '(w3m-form-face                        ;表格中字体
   ((((class color) (background dark))
     (:foreground "khaki2"
                  :underline "brown"
                  ))) t)
 '(w3m-header-line-location-content     ;地址内容
   ((((class color) (background dark))
     (:background "black"
                  :foreground "Green"))))
 '(w3m-header-line-location-title       ;地址标题
   ((((class color) (background dark))
     (:background "black"
                  :foreground "brown"))))
 '(w3m-history-current-url              ;当前历史连接
   ((t (:background "black"
                    :foreground "DodgerBlue"))))
 '(w3m-image                            ;图像
   ((((class color) (background dark))
     (:background "Black"
                  :foreground "DarkRed"))))
 '(w3m-image-anchor                     ;图像锚定
   ((((class color) (background dark))
     (:background "Black"))))
 '(w3m-session-select                   ;任务选择
   ((((class color) (background dark))
     (:foreground "grey50"))))
 '(w3m-tab-background                   ;标签背景
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "black"))))
 '(w3m-tab-selected-background          ;标签选择背景
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "black"))))
 '(w3m-tab-mouse                        ;鼠标点击标签
   ((((type x w32 mac) (class color))
     (:background "DarkRed"
                  :foreground "white"
                  :box (:line-width -1
                                    :color "Red"
                                    :style released-button)))))
 '(w3m-tab-selected                     ;选择的浏览过的标签
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "LawnGreen"
                  :box (:line-width -1
                                    :color "#014500"
                                    :style released-button)))))
 '(w3m-tab-selected-retrieving          ;选择的死掉的标签
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "grey80"
                  :box (:line-width -1
                                    :color "Grey40"
                                    :style released-button)))))
 '(w3m-tab-unselected                   ;未选择已浏览的标签
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "#10650F"
                  :box (:line-width 1
                                    :color "Black"
                                    :style pressed-button)))))
 '(w3m-tab-unselected-retrieving        ;未选择的死掉的标签
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "grey30"
                  :box (:line-width 1
                                    :color "Black"
                                    :style pressed-button)))))
 '(w3m-tab-unselected-unseen            ;未选择的没有浏览过的标签
   ((((type x w32 mac) (class color))
     (:background "black"
                  :foreground "DodgerBlue"
                  :box (:line-width 1
                                    :color "black"
                                    :style pressed-button)))))
 '(w3m-link-numbering                   ;数字连接
   ((((class color) (background dark))
     (:background "Black"
                  :foreground "Grey"))))
)
