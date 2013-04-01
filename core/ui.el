;; Last updated: <2013/04/02 01:29:45 algernon@madhouse-project.org>

(packages-maybe-install '(solarized-theme zenburn-theme color-theme))

(load "color-theme-library")

(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'custom-theme-load-path (concat user-emacs-directory
                                                   "packages/color-theme-tangotango"))
      (add-to-list 'custom-theme-load-path (concat user-emacs-directory
                                                   "packages/naquadah-theme")))
  (progn
    (add-to-list 'load-path (concat user-emacs-directory
                                    "packages/color-theme-tangotango"))
    (require 'color-theme-tangotango)))

(setq custom-safe-themes t
      inhibit-startup-message t
      visible-bell t
      font-lock-maximum-decoration t
      transient-mark-mode nil
      global-font-lock-mode t
      frame-title-format '(buffer-file-name "%f" ("%b"))
      color-theme-is-global t
      uniquify-buffer-name-style 'forward
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80)

(setq-default indicate-buffer-boundaries 'left
              indicate-empty-lines nil)

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode
                blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

(column-number-mode 1)
(delete-selection-mode t)
(mouse-wheel-mode t)
(show-paren-mode)
(set-language-environment 'utf-8)

(setq x-select-enable-clipboard t)
(if (functionp 'x-cut-buffer-or-selection-value)
    (setq interprogram-paste-function
          'x-cut-buffer-or-selection-value))

(if (and (eq window-system 'x))
    (progn
      (if (>= emacs-major-version 24)
          (load-theme 'naquadah t)
        (color-theme-tangotango)))
  (progn
    (if (>= emacs-major-version 24)
        (load-theme 'solarized-light t)
      (color-theme-arjen))))

;; Set the modeline
(when window-system
  (setq-default mode-line-format
                (list

                 ;; the buffer name; the file name as a tool tip
                 mode-line-client
                 '(:eval (propertize "%b "
                                     'face 'font-lock-keyword-face
                                     'help-echo (buffer-file-name)))

                 ;; line and column
                 "(" ;; '%02' to set to 2 chars at least; prevents flickering
                 (propertize "%02l" 'face 'font-lock-type-face) ","
                 (propertize "%02c" 'face 'font-lock-type-face)
                 ") "

                 ;; relative position, size of file
                 "["
                 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
                 "/"
                 (propertize "%I" 'face 'font-lock-constant-face) ;; size
                 "] "

                 ;; the current major mode for the buffer.
                 "["
                 '(:eval (propertize "%m" 'face 'font-lock-string-face
                                     'help-echo buffer-file-coding-system))
                 "] "

                 ;; insert vs overwrite mode, input-method in a tooltip
                 "["
                 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                     'face 'font-lock-preprocessor-face
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode "overwrite" "insert") " mode")))

                 ;; was this buffer modified since the last save?
                 '(:eval (when (buffer-modified-p)
                           (concat ","  (propertize "Mod"
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer has been modified"))))

                 ;; is this buffer read-only?
                 '(:eval (when buffer-read-only
                           (concat ","  (propertize "RO"
                                                    'face 'font-lock-type-face
                                                    'help-echo "Buffer is read-only"))))
                 "] "

                 ;; add misc. mode line info
                 "-- "
                 '(:eval (when (>= emacs-major-version 24) mode-line-misc-info))
                 "--"

                 ;; add minor modes
                 " ["
                 `(:propertize ("" minor-mode-alist)
                               mouse-face mode-line-highlight
                               face font-lock-keyword-face
                               help-echo "mouse-1: minor-mode menu, mouse-2: minor-mode help, mouse-3: toggle minor modes"
                               local-map ,mode-line-minor-mode-keymap)
                 " ]"

                 ;; fill the rest with spaces
                 '(:eval (when (>= emacs-major-version 24) mode-line-end-spaces))
                 )))

;; Diminish minor modes, and lookalikes
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "paredit"
  '(diminish 'paredit-mode "PE"))
(eval-after-load "undo-tree"
  '(diminish 'undo-tree-mode))
(eval-after-load "volatile-highlights"
  '(diminish 'volatile-highlights-mode))
(eval-after-load "git-gutter"
  '(diminish 'git-gutter-mode))
(eval-after-load "auto-complete"
  '(diminish 'auto-complete-mode))
(eval-after-load "yasnippet"
  '(diminish 'yas-minor-mode))
(eval-after-load "server"
  '(diminish 'server-buffer-clients))

; Develock needs some more hackery...
(make-face 'develock-mode)
(setq-default develock-mode-strings
              '(" DL" nil))
(add-minor-mode 'font-lock-mode
                (cons 'develock-mode develock-mode-strings))
