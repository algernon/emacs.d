;; Last updated: <2015/07/02 06:56:27 algernon@madhouse-project.org>

(defalias 'yes-or-no-p #'y-or-n-p)

(unless (eq system-type 'windows-nt)
  (progn
    (set-face-attribute 'default nil :family "Droid Sans Mono")
    (set-face-attribute 'default nil :height 120)))

(use-package auto-dim-other-buffers
  :diminish auto-dim-other-buffers-mode
  :ensure t
  :init
  (add-hook 'after-init-hook
            #'auto-dim-other-buffers-mode
            t))

(use-package golden-ratio
  :diminish golden-ratio-mode
  :ensure t
  :if (not (is-presentingp))
  :bind (("C-w g" . golden-ratio-mode))
  :config
  (setq golden-ratio-exclude-modes '("calendar-mode"
                                     "gnus-summary-mode"
                                     "gnus-article-mode"
                                     "gnus-topic-mode"
                                     "gnus-group-mode"
                                     "calc-mode" "calc-trail-mode"
                                     "bbdb-mode"))
  :init (golden-ratio-mode))

(use-package page-break-lines
  :disabled t
  :ensure t
  :diminish page-break-lines-mode
  :init (global-page-break-lines-mode))

(use-package swiper
  :ensure t
  :config
  (progn
    (defun counsel--load-theme-action (x)
      "Disable current themes and load theme X."
      (condition-case nil
          (progn
            (mapc #'disable-theme custom-enabled-themes)
            (load-theme (intern x))
            (when (fboundp 'powerline-reset)
              (powerline-reset)))
        (error "Problem loading theme %s" x)))

    (defun counsel-load-theme ()
      "Forward to `load-theme'.
Usable with `ivy-resume', `ivy-next-line-and-call' and
`ivy-previous-line-and-call'."
      (interactive)
      (ivy-read "Load custom theme: "
                (mapcar 'symbol-name
                        (custom-available-themes))
                :action #'counsel--load-theme-action))))

(setq custom-safe-themes t
      inhibit-startup-message t
      visible-bell t
      font-lock-maximum-decoration t
      transient-mark-mode t
      global-font-lock-mode t
      frame-title-format '(buffer-file-name "%f" ("%b"))
      uniquify-buffer-name-style 'forward
      indicate-buffer-boundaries 'left
      indicate-empty-lines nil
      show-trailing-whitespace 1
      window-combination-resize t)

(dolist (mode '(menu-bar-mode
                tool-bar-mode
                scroll-bar-mode
                blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

(column-number-mode 1)
(delete-selection-mode t)
(when (fboundp #'mouse-wheel-mode)
  (mouse-wheel-mode t))
(show-paren-mode)
(set-language-environment 'utf-8)
(when (fboundp #'fringe-mode)
  (fringe-mode '(1 . 0)))

(setq x-select-enable-clipboard t)
(if (functionp #'x-selection-value)
    (setq interprogram-paste-function
          #'x-selection-value))

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

;; Diminish minor modes, and lookalikes
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "server"
  '(diminish 'server-buffer-clients))

;; Auto-fill uses left-align from FontAwesome
(diminish 'auto-fill-function (concat " " [#xF036]))
(diminish 'overwrite-mode (concat " " [#xF0CC]))

(provide 'aec/ui)
