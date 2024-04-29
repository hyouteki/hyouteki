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
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("c71fd8fbda070ff5462e052d8be87423e50d0f437fbc359a5c732f4a4c535c43" "adfe1d522a4a100edade12797079ebbabf742a48cf098e7d10ea14012e156ee8" "55ab8347eb990d396909052089f0f83acca1831e8c80558319cee2c526a769d6" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "5a00018936fa1df1cd9d54bee02c8a64eafac941453ab48394e2ec2c498b834a" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "b95f61aa5f8a54d494a219fcde9049e23e3396459a224631e1719effcb981dbd" "a131602c676b904a5509fff82649a639061bf948a5205327e0f5d1559e04f5ed" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "0170347031e5dfa93813765bc4ef9269a5e357c0be01febfa3ae5e5fcb351f09" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37" "788121c96b7a9b99a6f35e53b7c154991f4880bb0046a80330bb904c1a85e275" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "b5fab52f16546a15f171e6bd450ff11f2a9e20e5ac7ec10fa38a14bb0c67b9ab" "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" default))
 '(indent-tabs-mode t)
 '(package-selected-packages
   '(melancholy-theme monokai-theme reykjavik-theme gruber-darker-theme go-mode kaolin-themes gruvbox-theme haskell-mode markdown-mode multiple-cursors smex rust-mode use-package))
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
