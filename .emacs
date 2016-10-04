;; Packages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "74c328628e9ced700633c9740666e56f40da5062d93b99b7f2cabb54d0b9194a" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(elfeed-feeds
   (quote
    ("https://github.com/Microsoft/vscode/releases.atom" "https://github.com/atom/atom/releases.atom")))
 '(fci-rule-color "#20240E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 )
(add-to-list 'package-archives  (quote
   (("melpa" . "http://melpa.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa-stable" . "http://stable.melpa.org/packages/")
    )))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set keyboard shortcuts
(global-set-key (kbd "M-a") 'compile)
(global-set-key (kbd "M-g") 'gdb)
(global-set-key (kbd "M-t") 'term)
(global-set-key (kbd "M-s") 'ispell-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "M-w") 'browse-web)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-o") 'menu-find-file-existing)
(global-set-key (kbd "C-S-o") 'dired)
(global-set-key (kbd "C-p") 'package-install)
(global-set-key (kbd "C-l") 'load-file)
;; Enable CUA mode, which provides more traditional keyboard shortcuts for copy, paste, etc.s
(cua-mode t)
(global-set-key (kbd "C-x w") 'elfeed)

;; Set environment variables
;;(setq initial-buffer-choice "~/Documents/CodeLite/CPP-Math-Projects/Simple-Pendulum")
(setq ring-bell-function 'ignore)
(setq compilation-read-command nil)

;; if ~/.emacs.d/vendor/coffee-mode is absent git clone defunkt/coffee-mode to it!
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Add tabbar adjustments
;;(load-file "~/.emacs.d/tabbar.el")
