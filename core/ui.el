;; Last updated: <2013/04/01 14:33:39 algernon@madhouse-project.org>

(packages-maybe-install '(solarized-theme zenburn-theme color-theme))

(add-to-list 'custom-theme-load-path (concat user-emacs-directory
					     "packages/color-theme-tangotango"))

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
      (when (>= emacs-major-version 24)
	(load-theme 'tangotango t)))
  (progn
    (load-theme 'solarized-light t)))
