
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("a1e99cb36d6235abbe426a0a96fc26c006306f6b9d2a64c2435363350a987b4c" default)))
 '(org-agenda-files nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "C:/Users/epk935/Desktop/Todo.org")
 '(package-selected-packages (quote (avy ranger magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;turn off menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;evil mode - install in path first
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
;;line numbering
(global-linum-mode t)
;;word-wrap
(setq-default word-wrap t)
;;add melpa archive to packages
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.org/packages/") t)
;;magit keybind
(global-set-key (kbd "C-x g") 'magit-status)
;;change font to consolas
(set-face-attribute 'default nil :family "Consolas" :height 110)
;;avy cursor jump to word - download from melpa
(require 'avy)
(global-set-key (kbd "C-'") 'avy-goto-char)
;jump to any spot based on letter
;;install from github into that folder first
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'curve)
(require 'powerline-evil)
;;highlight line cursor is on
(global-hl-line-mode +1)
;;zenburn theme - install in below directory first
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash")
;;less info in dired
(defun my-dired-mode-setup () "show less information in dired buffers" (dired-hide-details-mode 1)) (add-hook 'dired-mode-hook 'my-dired-mode-setup)
;;allows you to open 2 dired windows, when you press C to copy a file in one dired the directory in the
;;next dired will be the default destination
(setq dired-dwim-target t)
;;prevents dired from opening a new buffer for each directory visited
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))
