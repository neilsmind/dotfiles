(require 'shell-pop)
(setq shell-pop-shell-type  (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
(setq shell-pop-set-internal-mode-shell "/bin/zsh")
(setq shell-pop-set-window-height 60) ;the number for the percentage of the selected window. if 100, shell-pop use the whole of selected window, not spliting.
(setq shell-pop-set-window-position "bottom") ;shell-pop-up position. You can choose "top" or "bottom". 
(global-set-key [f7] 'shell-pop)
