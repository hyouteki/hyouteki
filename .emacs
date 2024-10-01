(require 'package)

(add-to-list 'package-archives
	         '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq inhibit-startup-screen t)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4
	  cpp-basic-offset 4) 
(setq default-directory "/home/nosferatu/")
(setq custom-file ".emacs.custom.el")
	
(load-file custom-file)
	
;; fullscreen-mode default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

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

;; ido-mode
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-show-dot-for-dired t)

;; smex: for minibuffer completions 
(use-package smex
  :bind (("M-x" . smex))
  :config (smex-initialize))

;; custom key bindings
(global-set-key (kbd "C-,") 'duplicate-line)

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

