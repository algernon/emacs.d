;; Last updated: <2015/01/08 12:46:20 algernon@madhouse-project.org>

(use-package saveplace
  :ensure t
  :config (setq-default save-place t))

(use-package savehist
  :ensure t
  :init (savehist-mode t))

(provide 'aec/packs/history)
