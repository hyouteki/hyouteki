(require 'package)

(add-to-list 'package-archives
	         '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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
   '("c10d238f7769b2c68cc9a3d8d6bcdaa6b1147954c51d36b31df0ea0a625ce28b" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "9fb561389e5ac5b9ead13a24fb4c2a3544910f67f12cfcfe77b75f36248017d0" "c662f882b31c3867b8d5c92692f70250a9d4d6c98eeb5b0175cb744d6c00b82f" default))
 '(indent-tabs-mode t)
 '(package-selected-packages
   '(scala-mode dockerfile-mode yaml-mode solarized-theme powershell glsl-mode cmake-mode go-mode kaolin-themes haskell-mode markdown-mode multiple-cursors smex rust-mode use-package))
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

;; default directory
(setq default-directory "/home/nosferatu/" )
