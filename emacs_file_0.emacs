(when (>= emacs-major-version 24)                                               
  (require 'package)                                                            
  (package-initialize)                                                          
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)                                                                          
  )                                                                             
                                                                                
;(when (fboundp 'windmove-default-keybindings)                                  
;  (windmove-default-keybindings))                                              
                                                                                
(global-set-key (kbd "C-x <up>") 'windmove-up)                                  
(global-set-key (kbd "C-x <down>") 'windmove-down)                              
(global-set-key (kbd "C-x <right>") 'windmove-right)                            
(global-set-key (kbd "C-x <left>") 'windmove-left)                              
                                                                                
(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20150423.1929")               
(add-to-list 'load-path "~/.emacs.d/elpa/ac-js2-20140906.442")                  
(add-to-list 'load-path "~/.emacs.d/elpa/ac-html-20150118.2116")                
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")          
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20150415.244")               
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150315.612")                   
(add-to-list 'load-path "~/.emacs.d/elpa/simple-httpd-20150422.1825")           
(add-to-list 'load-path "~/.emacs.d/elpa/skewer-mode-20150422.1818")            
(add-to-list 'load-path "~/.emacs.d/elpa/web-mode-20150424.144")                
(add-to-list 'load-path "~/.emacs.d/elpa/paredit-20150217.713")                 
(add-to-list 'load-path "~/.emacs.d/elpa/web-beautify-20131118.226")            
(add-to-list 'load-path "~/.emacs.d/elpa/haml-mode-20150508.2011")              
(add-to-list 'load-path "~/.emacs.d/elpa/sass-mode-20150508.2012")              
(add-to-list 'load-path "~/.emacs.d/elpa/jdee-20151005.1237")                   
(add-to-list 'load-path "~/.emacs.d/elpa/php-mode-20160831.819")                
(add-to-list 'load-path "~/.emacs.d/elpa/yaml-mode-20160902.1142")              
                                                                                
                                                                                
;; yaml-mode                                                                    
(require 'yaml-mode)                                                            
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))                       
                                                                                
                                                                                
;; ido mode                                                                     
(require 'ido)                                                                  
(ido-mode 1)            

;; add line num mode
(global-linum-mode t) 
                                                                                
;; java mode                                                                    
(require 'jdee)                                                                 
                                                                                
(require 'js-doc)    
(setq js-doc-mail-address "yangjun@nanchao.org"                              
      js-doc-author (format "Yang Jun <%s>" js-doc-mail-address)             
      js-doc-url "http://ruff.io"                                            
      js-doc-license "MIT license")                                          
                                            
                                                                                
(require 'haml-mode)                                                            
(require 'sass-mode)                                                            
                                                                                
;;(require 'php-mode)                                                           
(autoload 'php-mode "php-mode" "PHP editing mode" t)    

; js2 mode                                                                     
(add-hook 'js-mode-hook 'js2-minor-mode)                                        
;;(add-hook 'js2-mode-hook 'ac-js2-mode)                                        
(setq js2-highlight-level 3)                                                    
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))                  
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))                         
(setq js-basic-indent 2)                                                        
(setq-default js2-basic-indent 2)                                               
(setq-default js2-basic-offset 2)                                               
(setq-default js2-auto-indent-p 0)                                              
(setq-default js2-cleanup-whitespace t)                                         
(setq-default js2-enter-indents-newline t)                                      
(setq-default js2-global-externs "jQuery $")                                    
(setq-default js2-indent-on-enter-key t)                                        
(setq-default js2-mode-indent-ignore-first-tab t)                               
;;(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert"\
;; "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" \
;;"__dirname" "console" "JSON"))                                                  
                                                                                
;; for js2 code folding                                                         
;; If cursor is in the function block, M-x hs-hide-block, the function turns in\
to folding                                                                      
;; C-c @                Prefix Command                                          
                                                                                
;; C-c @ C-c    hs-toggle-hiding                                                
;; C-c @ C-h    hs-hide-block                                                   
;; C-c @ C-l    hs-hide-level                                                   
;; C-c @ C-s    hs-show-block                                                   
;; C-c @ ESC    Prefix Command                                                  
                                                                                
;; C-c @ C-M-h  hs-hide-all                                                     
;; C-c @ C-M-s  hs-show-all                                                     
                                                                                
(add-hook 'js-mode-hook                                                         
          (lambda ()                                                            
            ;; Scan the file for nested code blocks                             
            (imenu-add-menubar-index)                                           
            ;; Activate the folding mode                                        
            (hs-minor-mode t)))                                                 
                                                                                
                                                                                
                                                                                
;; yasnippet                                                                    
;; load before auto complete                                                    
(require 'yasnippet)                                                            
(setq yas-snippet-dirs                                                          
      '("~/.emacs.d/elpa/yasnippet/snippets"                                    
                                                                                
        ))                                                                      
(yas-global-mode 1)                                                             
                                                                                
;; It may not be used yet.                                                      
(require 'skewer-mode)                                                          
                                                                                
;; autocomplete mode        
(require 'auto-complete-config)                                                 
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150488.1132/dict")                                                                    
(add-to-list 'ac-sources 'ac-source-yasnippet)                                  
(ac-config-default)                                                             
(ac-set-trigger-key "TAB")                                                      
(ac-set-trigger-key "<tab>")                                                    
(global-auto-complete-mode t)                                                   
(setq ac-auto-start 2)                                                          
;;(setq-default indent-tabs-mode nil)                                           
                                                                                
;; web-mode                                                                     
;(require 'web-mode)                                                            
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))                     
;(setq web-mode-markup-indent-offset 4)                                         
;(setq web-mode-css-indent-offset 4)                                            
;(setq web-mode-code-indent-offset 4)                                           
                                                                                
;; how about web mode-name                                                      
                                                                                
(require 'web-mode)                                                             
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))                      
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))                  
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))                    
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))                    
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))                        
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))                   
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))                     
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))                      
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))                        
                                                                                
(defun my-web-mode-hook ()                                                      
  "Hooks for Web mode."                                                         
  (setq web-mode-markup-indent-offset 2)                                        
  (setq web-mode-css-indent-offset 2)                                           
                                                                                
  (setq web-mode-code-indent-offset 2)                                          
                                                                                
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))             
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))            
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))          
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))          
                                                                                
  (setq web-mode-style-padding 1)                                               
                                                                                
  (setq web-mode-comment-style 2)                                               
                                                                                
  ;; (set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")       
                                                                                
  (setq web-mode-enable-auto-pairing t)                                         
                                                                                
  (setq web-mode-enable-css-colorization t)        
  
   (setq web-mode-enable-part-face t)                                            
                                                                                
  (setq web-mode-enable-comment-keywords t)                                     
                                                                                
  (setq web-mode-enable-heredoc-fontification t)                                
                                                                                
  (setq web-mode-enable-current-element-highlight t)                            
                                                                                
  (setq web-mode-enable-current-column-highlight t)                             
                                                                                
  (setq web-mode-ac-sources-alist                                               
        '(("css" . (ac-source-css-property))                                    
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))             
                                                                                
  )                                                                             
(add-hook 'web-mode-hook  'my-web-mode-hook)                                    
                                                                                
                                                                                
;; ac-html mode                                                                 
;; (require 'ac-html)                                                           
;; ;(add-to-list 'web-mode-ac-sources-alist                                     
;; ;             '("html" . (ac-source-html-attribute-value                     
;; ;                         ac-source-html-tag                                 
;; ;                         ac-source-html-attribute)))                        
;; (add-hook 'html-mode-hook 'ac-html-enable)                                   
;; (add-hook 'html-mode-hook                                                    
;;           (lambda ()                                                         
;;             ;; Default indentation is usually 2 spaces, changing to 4.       
;;             (set (make-local-variable 'sgml-basic-offset) 2)))               
                                                                                
                                                                                
                                                                                
;;paredit mode                                                                  
(require 'paredit)                                                              
(defun my-paredit-nonlisp ()                                                    
  "Turn on paredit mode for non-lisps."                                         
  (interactive)                                                                 
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)            
       '((lambda (endp delimiter) nil)))                                        
  (paredit-mode 1))    

(autoload 'enable-paredit-mode "paredit"
           "Turn on pseudo-structural editing of Lisp code."
           t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


                                                         
(add-hook 'js2-mode-hook 'my-paredit-nonlisp) ;use with the above function      

;; web-beauty                                                                   
(require 'web-beautify) ;; Not necessary if using ELPA package                  
(eval-after-load 'js2-mode                                                      
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))                    
(eval-after-load 'json-mode                                                     
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))                   
(eval-after-load 'sgml-mode                                                     
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))                 
(eval-after-load 'css-mode                                                      
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))                   


                                                                                
(custom-set-variables                                                           
 ;; custom-set-variables was added by Custom.                                   
 ;; If you edit it by hand, you could mess it up, so be careful.                
 ;; Your init file should contain only one such instance.                       
 ;; If there is more than one, they won't work right.                           
 '(ansi-color-faces-vector                                                      
   [default default default italic underline success warning error])            
 '(ansi-color-names-vector                                                      
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])                                                                          
 '(custom-enabled-themes (quote (manoj-dark))))                                 
(custom-set-faces                                                               
 ;; custom-set-faces was added by Custom.                                       
 ;; If you edit it by hand, you could mess it up, so be careful.                
 ;; Your init file should contain only one such instance.                       
 ;; If there is more than one, they won't work right.                           
 )                                                                              
(put 'upcase-region 'disabled nil)          

