;;(require 'cask "~/.emacs.d/.cask/24.5.1/elpa/cask-20151123.528/cask.el")
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/personal/defuns")

(personal 'bindings)
(personal 'coffee-mode)
(personal 'dash-at-point)
(personal 'diff)
(personal 'exec-path-from-shell)
(personal 'exec_path)
(personal 'expand-region)
(personal 'floobits)
(personal 'flycheck)
(personal 'global)
(personal 'highlight)
(personal 'ido)
(personal 'magit)
(personal 'magit-filenotify)
(personal 'magit-gh-pulls)
(personal 'multiple-cursors)
(personal 'powerline)
(personal 'projectile)
(personal 'rbenv)
(personal 'rubocop)
(personal 'ruby)
(personal 'server-mode)
(personal 'shell-pop)
(personal 'smartparens)
;;(personal 'private)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
