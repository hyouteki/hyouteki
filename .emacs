(require 'package)

(add-to-list 'package-archives
	         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4
	  cpp-basic-offset 4) 

;; changing font
(set-face-attribute 'default nil :font "DejaVu Sans Mono")

;; fullscreen-mode default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; disabling menu-bar, tool-bar and scroll-bar
;; reference: http://kb.mit.edu/confluence/display/istcontrib/Disabling+the+Emacs+menubar%2C+toolbar%2C+or+scrollbar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; disabling startup welcome screen
(setq inhibit-startup-screen t)

;; displaying line number in relative mode
;; reference: https://stackoverflow.com/a/54392862/22342267
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; mouse scroll speed reduction
;; reference: https://stackoverflow.com/a/26053341/22342267
(setq mouse-wheel-scroll-amount '(0.07))
(setq mouse-wheel-progressive-speed nil)
(setq ring-bell-function 'ignore)

;; syntax highlighting
(setq font-lock-maximum-decoration t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(solarized-dark))
 '(custom-safe-themes
   '("c662f882b31c3867b8d5c92692f70250a9d4d6c98eeb5b0175cb744d6c00b82f" default))
 '(indent-tabs-mode t)
 '(package-selected-packages
   '(glsl-mode cmake-mode solarized-theme melancholy-theme monokai-theme reykjavik-theme gruber-darker-theme go-mode kaolin-themes gruvbox-theme haskell-mode markdown-mode multiple-cursors smex rust-mode use-package))
 '(resize-mini-windows 'grow-only)
 '(standard-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "outline" :family "DejaVu Sans Mono")))))

;; ido-mode
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-show-dot-for-dired t)

;; smex: for minibuffer completions 
(use-package smex
  :bind (("M-x" . smex))
  :config (smex-initialize))

;; resizing minibuffer
(setq resize-mini-windows t)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; language modes
(require 'rust-mode)

(put 'downcase-region 'disabled nil)

;; custom functions
(defun open-in-browser()
  (interactive)
  (let ((filename (buffer-file-name)))
    (browse-url (concat "file://" filename))))
