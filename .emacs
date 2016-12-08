;; Packages

(package-initialize)

(require 'package) ;; You might already have this line
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"] t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("1dffeecd1565d04cd2059234e872cd80fcbe813488602d5c42b5c9e576924d9f" "a2dd771a05705be2a6e6adb6ddbc7a27ebf49edab1dffdbefe243096becba7c9" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "28c07d8e75ed7e2ea9154239caa4f9d3fc831cf2340ea3e307ee49b4321dc7f5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "74c328628e9ced700633c9740666e56f40da5062d93b99b7f2cabb54d0b9194a" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(elfeed-feeds
   (quote
    ("https://github.com/Microsoft/vscode/releases.atom" "https://github.com/atom/atom/releases.atom")))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#000000" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#000000")
     (varField :foreground "#600e7a" :slant italic)
     (valField :foreground "#600e7a" :slant italic)
     (functionCall :foreground "#000000" :slant italic)
     (implicitConversion :underline
			 (:color "#c0c0c0"))
     (implicitParams :underline
		     (:color "#c0c0c0"))
     (operator :foreground "#000080")
     (param :foreground "#000000")
     (class :foreground "#20999d")
     (trait :foreground "#20999d" :slant italic)
     (object :foreground "#5974ab" :slant italic)
     (package :foreground "#000000")
     (deprecated :strike-through "#000000"))))
 '(fci-rule-character-color "#d9d9d9")
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
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (dired-icon all-the-icons-dired gnuplot white-theme vala-mode twilight-bright-theme tabbar-ruler sage-shell-mode rust-mode rpm-spec-mode pyvenv python-pylint python-mode python-cell pylint powershell pkgbuild-mode php-mode monokai-theme matlab-mode markdown-mode lua-mode highlight-indentation haskell-mode go-mode go gnuplot-mode elfeed dockerfile-mode cpputils-cmake coffee-mode clojure-mode)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Set keyboard shortcuts
(global-set-key (kbd "M-a") 'compile)
(global-set-key (kbd "M-g") 'gdb)
(global-set-key (kbd "M-t") 'term)
(global-set-key (kbd "M-s") 'ispell-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "M-w") 'browse-web)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-z") 'undo)
(cua-mode t)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
;(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-o") 'menu-find-file-existing)
(global-set-key (kbd "C-S-o") 'dired)
(global-set-key (kbd "C-p") 'package-install)
(global-set-key (kbd "C-l") 'load-file)
(global-set-key (kbd "M-r") 'package-refresh-contents)

;; Enable CUA mode, which provides more traditional keyboard shortcuts for copy, paste, etc.s
(cua-mode t)
(global-set-key (kbd "C-x w") 'elfeed)

;; Set environment variables
;(setq initial-buffer-choice "~/Documents/CodeLite/CPP-Math-Projects/Simple-Pendulum")
(setq ring-bell-function 'ignore)
(setq compilation-read-command nil)

;; if ~/.emacs.d/vendor/coffee-mode is absent git clone defunkt/coffee-mode to it!
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(dolist (package '(python-mode python-pylint powershell vala-mode sage-shell-mode tabbar-ruler rust-mode rpm-spec-mode pyvenv python-cell pylint pkgbuild-mode php-mode monokai-theme markdown-mode lua-mode highlight-indentation haskell-mode go-mode go gnuplot gnuplot-mode elfeed dockerfile-mode cpputils-cmake coffee-mode clojure-mode))
 (unless (package-installed-p package)
   (package-install package))
   (require package))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(speedbar 1)
