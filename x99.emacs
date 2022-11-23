;; .emacs                                                                       

(when (>= emacs-major-version 24)                                              \

  (require 'package)                                                           \

  (package-initialize)                                                         \

  (add-to-list 'package-archives '("tsinghua" . "http://mirrors.tuna.tsinghua.e\
du.cn/elpa/melpa/") t)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"\
))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  )

(global-set-key (kbd "C-x <up>") 'windmove-up)                                 \

(global-set-key (kbd "C-x <down>") 'windmove-down)                             \

(global-set-key (kbd "C-x <right>") 'windmove-right)                           \

(global-set-key (kbd "C-x <left>") 'windmove-left)

(add-to-list 'load-path "~/.emacs.d/elpa/paredit")
(add-to-list 'load-path "~/.emacs.d/elpa/macrostep-geiser")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20220105.439")
(add-to-list 'load-path "~/.emacs.d/elpa/geiser-20220905.2341")
(add-to-list 'load-path "~/.emacs.d/elpa/geiser-chez-20211216.2332")
(add-to-list 'load-path "~/.emacs.d/elpa/ac-geiser-20200318.824")
(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-20220829.225")
(add-to-list 'load-path "~/.emacs.d/elpa/cuda-mode-20201013.2230")
(custom-set-variables
 ;; custom-set-variables was added by Custom.                                   
 ;; If you edit it by hand, you could mess it up, so be careful.                
 ;; Your init file should contain only one such instance.                       
 ;; If there is more than one, they won't work right.                           
 '(package-selected-packages
   (quote
    (cuda-mode verilog-mode edit-indirect ac-geiser markdown-mode geiser-racket\
 company geiser-chez geiser)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.                                       
 ;; If you edit it by hand, you could mess it up, so be careful.                
 ;; Your init file should contain only one such instance.                       
 ;; If there is more than one, they won't work right.                           
 )

;; ido mode                                                                    \
                                                                                
(require 'ido)                                                                 \

(ido-mode 1)

(add-to-list 'auto-mode-alist
             '("\\.sls\\'" . scheme-mode)
             '("\\.sc\\'" . scheme-mode))


;;paredit mode                                                                 \
                                                                                
(require 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)

;; company mode                                                                 
(global-company-mode)
(global-set-key (kbd "TAB")  #'company-indent-or-complete-common)

;; auto-complete mode                                                           
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20220105\
.439/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(global-auto-complete-mode t)
(setq ac-auto-start 2)


;; install geiser                                                               
(require 'geiser-chez)


(require 'ac-geiser)
(add-hook 'geiser-mode-hook 'ac-geiser-setup)
(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'geiser-repl-mode))

;; markdown mode                                                                
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . mark\
down-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;; how to set source-directories?                                               
;;                                                                              


;; Set tab to be 4                                                              
(setq-default tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

