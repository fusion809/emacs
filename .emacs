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
(add-to-list 'package-archives  (quote
   (("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "http://melpa.org/packages/")
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

;; Download tabbar version 2.0.1 by David Ponce:
;;   https://marmalade-repo.org/packages/tabbar
;; or use package-install for marmalade repositories.

;; Place tabbar-2.0.1.el in the `load-path` -- it is okay to rename it to tabbar.el
;; or add the directory (where `tabbar.el` resides) to the `load-path`.
;; EXAMPLE:  (setq load-path (append '("/Users/HOME/.emacs.d/lisp/") load-path))

(require 'tabbar)

(setq tabbar-cycle-scope 'tabs)

(remove-hook 'kill-buffer-hook 'tabbar-buffer-track-killed)

(defun my-buffer-groups ()
  "Function that gives the group names the current buffer belongs to.
It must return a list of group names, or nil if the buffer has no
group.  Notice that it is better that a buffer belongs to one group."
  (list
    (cond
      ((memq (current-buffer) (my-buffer-list (selected-frame)))
        "A")
      (t
        "N") )))

(setq tabbar-buffer-groups-function 'my-buffer-groups) ;; 'tabbar-buffer-groups

;; redefine tabbar-add-tab so that it alphabetizes / sorts the tabs
(defun tabbar-add-tab (tabset object &optional append)
  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
If the tab is added, it is added at the beginning of the tab list,
unless the optional argument APPEND is non-nil, in which case it is
added at the end."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let* (
          (tab (tabbar-make-tab object tabset))
          (tentative-new-tabset
            (if append
              (append tabs (list tab))
              (cons tab tabs)))
          (new-tabset
            (sort
               tentative-new-tabset
               #'(lambda (e1 e2)
                  (string-lessp
                    (format "%s" (car e1)) (format "%s" (car e2)))))))
        (tabbar-set-template tabset nil)
        (set tabset new-tabset)))))

;; AUTHOR:  Alp Aker -- https://github.com/alpaker/Frame-Bufs
;; @lawlist extracted/revised the function(ality) from said library.
(defun my-buffer-list (frame)
  ;; Remove dead buffers.
  (set-frame-parameter frame 'frame-bufs-buffer-list
    (delq nil (mapcar #'(lambda (x) (if (buffer-live-p x) x))
      (frame-parameter frame 'frame-bufs-buffer-list))))
  ;; Return the associated-buffer list.
  (frame-parameter frame 'frame-bufs-buffer-list) )

;; AUTHOR:  Alp Aker -- https://github.com/alpaker/Frame-Bufs
;; @lawlist extracted/revised the function(ality) from said library.
(defun my-add-buffer (&optional buf frame)
"Add BUF to FRAME's associated-buffer list if not already present."
(interactive)
  (let* (
      (buf (if buf buf (current-buffer)))
      (frame (if frame frame (selected-frame)))
      (associated-bufs (frame-parameter frame 'frame-bufs-buffer-list)))
    (unless (bufferp buf)
      (signal 'wrong-type-argument (list 'bufferp buf)))
    (unless (memq buf associated-bufs)
      (set-frame-parameter frame 'frame-bufs-buffer-list (cons buf associated-bufs)))
    (when tabbar-mode (tabbar-display-update)) ))

;; AUTHOR:  Alp Aker -- https://github.com/alpaker/Frame-Bufs
;; @lawlist extracted/revised the function(ality) from said library.
(defun my-remove-buffer (&optional buf frame)
"Remove BUF from FRAME's associated-buffer list."
(interactive)
  (let* (
      (buf (if buf buf (current-buffer)))
      (frame (if frame frame (selected-frame))))
    (set-frame-parameter frame 'frame-bufs-buffer-list
      (delq buf (frame-parameter frame 'frame-bufs-buffer-list)))
    (when tabbar-mode (tabbar-display-update))))

;; AUTHOR:  Alp Aker -- https://github.com/alpaker/Frame-Bufs
;; @lawlist extracted/revised the function(ality) from said library.
(defun my-buffer-list-reset ()
    "Wipe the entire slate clean for the selected frame."
  (interactive)
    (modify-frame-parameters (selected-frame) (list (cons 'frame-bufs-buffer-list nil)))
    (when tabbar-mode (tabbar-display-update)))

(defun my-switch-tab-group ()
"Switch between tab group `A` and `N`."
(interactive)
  (let* (
      (current-group (format "%s" (tabbar-current-tabset t)))
      (tab-buffer-list (mapcar
          #'(lambda (b)
              (with-current-buffer b
                (list (current-buffer)
                      (buffer-name)
                      (funcall tabbar-buffer-groups-function) )))
               (funcall tabbar-buffer-list-function))) )
    (catch 'done
      (mapc
        #'(lambda (group)
            (when (not (equal current-group
                          (format "%s" (car (car (cdr (cdr group)))))))
              (throw 'done (switch-to-buffer (car (cdr group))))))
        tab-buffer-list) )))

(defface tabbar-selected-associated
  '((t :background "black" :foreground "yellow" :box (:line-width 2 :color "yellow")))
  "Face used for the selected tab -- associated with the `frame-bufs-buffer-list`."
  :group 'tabbar)

(defface tabbar-unselected-associated
  '((t :background "black" :foreground "white" :box (:line-width 2 :color "white")))
  "Face used for unselected tabs  -- associated with the `frame-bufs-buffer-list`."
  :group 'tabbar)

(defface tabbar-selected-unassociated
  '((t :background "black" :foreground "white" :box (:line-width 2 :color "firebrick")))
  "Face used for the selected tab -- UNassociated with the `frame-bufs-buffer-list`."
  :group 'tabbar)

(defface tabbar-unselected-unassociated
  '((t :background "black" :foreground "white" :box (:line-width 2 :color "blue")))
  "Face used for unselected tabs -- UNassociated with the `frame-bufs-buffer-list`."
  :group 'tabbar)

(setq tabbar-background-color "black")

(defsubst tabbar-line-tab (tab)
  "Return the display representation of tab TAB.
That is, a propertized string used as an `header-line-format' template
element.
Call `tabbar-tab-label-function' to obtain a label for TAB."
  (concat
    (propertize
      (if tabbar-tab-label-function
          (funcall tabbar-tab-label-function tab)
        tab)
      'tabbar-tab tab
      'local-map (tabbar-make-tab-keymap tab)
      'help-echo 'tabbar-help-on-tab
      'mouse-face 'tabbar-highlight
      'face
        (cond
          ((and
              (tabbar-selected-p tab (tabbar-current-tabset))
              (memq (current-buffer) (my-buffer-list (selected-frame))))
            'tabbar-selected-associated)
          ((and
              (not (tabbar-selected-p tab (tabbar-current-tabset)))
              (memq (current-buffer) (my-buffer-list (selected-frame))))
            'tabbar-unselected-associated)
          ((and
              (tabbar-selected-p tab (tabbar-current-tabset))
              (not (memq (current-buffer) (my-buffer-list (selected-frame)))))
            'tabbar-selected-unassociated)
          ((and
              (not (tabbar-selected-p tab (tabbar-current-tabset)))
              (not (memq (current-buffer) (my-buffer-list (selected-frame)))))
            'tabbar-unselected-unassociated))
      'pointer 'hand)
    tabbar-separator-value))

(define-key global-map "\C-c\C-r" 'my-buffer-list-reset)

(define-key global-map "\C-c\C-a" 'my-add-buffer)

(define-key global-map "\C-c\C-n" 'my-remove-buffer)

(define-key global-map (kbd "<M-s-right>") 'tabbar-forward)

(define-key global-map (kbd "<M-s-left>") 'tabbar-backward)

(define-key global-map [C-tab] 'my-switch-tab-group)

(tabbar-mode 1)
