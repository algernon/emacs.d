;; Last updated: <2015/01/08 09:13:37 algernon@madhouse-project.org>

(use-package anzu
  :diminish anzu-mode
  :init (global-anzu-mode t))

(use-package fold-this
  :bind (("C-c C-f" . fold-this-all)
         ("C-c C-F" . fold-this)
         ("C-c M-f" . fold-this-unfold-all)))

(use-package hungry-delete
  :init (global-hungry-delete-mode t))

(use-package aggressive-indent)

(use-package abbrev
  :diminish abbrev-mode)

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package flyspell
  :diminish (flyspell-mode . " α"))

(use-package fancy-narrow
  :diminish fancy-narrow-mode
  :init (fancy-narrow-mode))

(use-package whitespace
  :diminish whitespace-mode
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config (setq whitespace-line-column 80
                whitespace-style '(face trailing lines-tail tabs)))

(use-package writeroom-mode
  :bind (("C-w r" . writeroom-mode))
  :config (progn
            (setq writeroom-fullscreen-effect 'maximized)
            (key-chord-define-global "wr" 'writeroom-mode)))

(use-package centered-window-mode
  :bind (("C-w w" . centered-window-mode)))
