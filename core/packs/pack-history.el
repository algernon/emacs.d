;; Last updated: <2015/01/08 09:39:23 algernon@madhouse-project.org>

(use-package saveplace
  :ensure t
  :config (setq-default save-place t))

(use-package savehist
  :ensure t
  :init (savehist-mode t))
