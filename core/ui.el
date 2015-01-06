;; Last updated: <2015/01/06 15:58:15 algernon@madhouse-project.org>

(set-frame-font "Droid Sans Mono-12" nil t)

(use-package auto-dim-other-buffers
  :diminish auto-dim-other-buffers-mode
  :init
  (add-hook 'after-init-hook 'auto-dim-other-buffers-mode
            t))

(use-package golden-ratio
  :commands (golden-ratio-enable)
  :if (is-presentingp)
  :init (golden-ratio-enable))

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

;; Diminish minor modes, and lookalikes
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "server"
  '(diminish 'server-buffer-clients))
(diminish 'auto-fill-function " ▤")
(diminish 'overwrite-mode " O")
