;; Last updated: <2015/01/08 11:07:53 algernon@madhouse-project.org>

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init (global-anzu-mode t))

(use-package fold-this
  :ensure t
  :defer t
  :bind (("C-c C-f" . fold-this-all)
         ("C-c C-F" . fold-this)
         ("C-c M-f" . fold-this-unfold-all)))

(use-package hungry-delete
  :ensure t
  :init (global-hungry-delete-mode t))

(use-package abbrev
  :diminish abbrev-mode)

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package flyspell
  :ensure t
  :defer t
  :diminish (flyspell-mode . " α"))

(use-package fancy-narrow
  :ensure t
  :defer t
  :diminish fancy-narrow-mode
  :idle (fancy-narrow-mode))

(use-package whitespace
  :ensure t
  :diminish whitespace-mode
  :init (dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
          (add-hook hook #'whitespace-mode))
  :config (setq whitespace-line-column 80
                whitespace-style '(face trailing lines-tail tabs)))

(use-package writeroom-mode
  :ensure t
  :defer t
  :bind (("C-w r" . writeroom-mode))
  :config (progn
            (setq writeroom-fullscreen-effect 'maximized)
            (key-chord-define-global "wr" 'writeroom-mode)))

(use-package centered-window-mode
  :ensure t
  :bind (("C-w w" . centered-window-mode)))
