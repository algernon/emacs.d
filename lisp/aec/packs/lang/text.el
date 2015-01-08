;; Last updated: <2015/01/08 12:52:38 algernon@madhouse-project.org>

(add-to-list 'auto-mode-alist
                     '("README$\\|NEWS$\\|INSTALL$\\|AUTHORS$\\|THANKS$"
                       . text-mode))

(setq flyspell-default-dictionary "british")

(use-package ispell
  :defer t
  :init (add-hook 'text-mode-hook #'turn-on-flyspell))

(add-hook 'text-mode-hook #'turn-on-auto-fill)

(use-package sentence-highlight
  :ensure t
  :defer t
  :diminish sentence-highlight-mode
  :init (progn
          (require 'sentence-highlight)
          (add-hook 'text-mode-hook #'sentence-highlight-mode)))

(provide 'aec/packs/lang/text)