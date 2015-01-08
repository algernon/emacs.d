;; Last updated: <2015/01/08 09:14:33 algernon@madhouse-project.org>

(set-face-attribute 'default nil :family "Droid Sans Mono")
(set-face-attribute 'default nil :height 120)

(use-package auto-dim-other-buffers
  :diminish auto-dim-other-buffers-mode
  :init
  (add-hook 'after-init-hook 'auto-dim-other-buffers-mode
            t))

(use-package golden-ratio
  :diminish golden-ratio-mode
  :if (not (is-presentingp))
  :init (golden-ratio-mode))

(use-package page-break-lines
  :disabled t
  :diminish page-break-lines-mode
  :init (global-page-break-lines-mode))

(setq custom-safe-themes t
      inhibit-startup-message t
      visible-bell t
      font-lock-maximum-decoration t
      transient-mark-mode t
      global-font-lock-mode t
      frame-title-format '(buffer-file-name "%f" ("%b"))
      uniquify-buffer-name-style 'forward
      indicate-buffer-boundaries 'left
      indicate-empty-lines nil)

(dolist (mode '(menu-bar-mode
                tool-bar-mode
                scroll-bar-mode
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

(setq x-select-enable-clipboard t)
(if (functionp 'x-cut-buffer-or-selection-value)
    (setq interprogram-paste-function
          'x-cut-buffer-or-selection-value))

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

;; Diminish minor modes, and lookalikes
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "server"
  '(diminish 'server-buffer-clients))
(diminish 'auto-fill-function " ▤")
(diminish 'overwrite-mode " O")
