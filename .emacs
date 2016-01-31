;; from emacs configuration in 24 minutes
;; env: ubuntu 14.04
(load-theme 'wombat)

(setq frame-title-format "emacs")

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(set-default 'cursor-type 'hbar)

(set-cursor-color "green")

(ido-mode)

(column-number-mode)

(show-paren-mode)

(winner-mode t)

(windmove-default-keybindings)

(load "package")
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; list the packages you want install
(setq package-list '(haml-mode
		     auto-complete 
		     smex
		     nlinum
		     autopair
		     switch-window))
; fetch the list of packages avaiable
(unless package-archive-contents
  (package-refresh-contents))
; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(ac-config-default)

(nlinum-mode)

(autopair-global-mode)

;; 禁用C-SPC，输入法需要用
(global-set-key (kbd "C-SPC") nil)

;; Setting English Font
(set-face-attribute
  'default nil :font "DejaVu Sans Mono 13")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "文泉驿等宽微米黑" :size 15)))

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(global-set-key (kbd "C-1") 'delete-other-windows)
