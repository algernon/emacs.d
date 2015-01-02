;; Last updated: <2015/01/02 19:43:14 algernon@madhouse-project.org>

(packages-maybe-install '(solarized-theme zenburn-theme color-theme
                          auto-dim-other-buffers molokai-theme))

(add-to-list 'load-path (concat user-emacs-directory
                                "packages/golden-ratio"))
(when (and (boundp 'debian-emacs-flavor)
           (eq debian-emacs-flavor 'emacs-snapshot)
           (not (is-presentingp)))
  (require 'golden-ratio)
  (golden-ratio-enable))

(load "color-theme-library")

(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'custom-theme-load-path (concat user-emacs-directory
                                                   "packages/color-theme-tangotango")))
  (progn
    (add-to-list 'load-path (concat user-emacs-directory
                                    "packages/color-theme-tangotango"))
    (require 'color-theme-tangotango)))

(setq custom-safe-themes t
      inhibit-startup-message t
      visible-bell t
      font-lock-maximum-decoration t
      transient-mark-mode t
      global-font-lock-mode t
      frame-title-format '(buffer-file-name "%f" ("%b"))
      color-theme-is-global t
      uniquify-buffer-name-style 'forward)

(setq-default indicate-buffer-boundaries 'left
              indicate-empty-lines nil)

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode
                blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

(column-number-mode 1)
(delete-selection-mode t)
(when (fboundp 'mouse-wheel-mode)
  (mouse-wheel-mode t))
(show-paren-mode)
(set-language-environment 'utf-8)
(when (fboundp 'fringe-mode)
  (fringe-mode '(1 . 0)))
(global-whitespace-mode +1)

(setq x-select-enable-clipboard t)
(if (functionp 'x-cut-buffer-or-selection-value)
    (setq interprogram-paste-function
          'x-cut-buffer-or-selection-value))

(if (>= emacs-major-version 24)
    (load-theme 'molokai t)
  (color-theme-tangotango))

;; Diminish minor modes, and lookalikes
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "server"
  '(diminish 'server-buffer-clients))
(eval-after-load "abbrev"
  '(diminish 'abbrev-mode))
(diminish 'auto-fill-function "▤")
(diminish 'overwrite-mode "O")

(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))
