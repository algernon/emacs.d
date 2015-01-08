;; Last updated: <2015/01/08 12:51:16 algernon@madhouse-project.org>

(use-package css-mode
  :ensure t
  :defer t
  :config (setq css-electric-brace-behavior t
                css-electric-semi-behavior t
                css-indent-offset 8))

(provide 'aec/packs/lang/css)
