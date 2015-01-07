;; Last updated: <2015/01/07 09:23:50 algernon@madhouse-project.org>

(use-package writeroom-mode
  :bind (("C-w r" . writeroom-mode))
  :config (progn
            (setq writeroom-fullscreen-effect 'maximized)
            (key-chord-define-global "wr" 'writeroom-mode)))
