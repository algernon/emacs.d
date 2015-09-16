;; Last updated: <2015/09/16 10:10:37 algernon@madhouse-project.org>

(require 'eshell)
(require 'em-smart)
(require 'em-term)

(add-to-list 'eshell-visual-commands "htop")
(setq eshell-where-to-jump 'begin
      eshell-review-quick-commands nil
      eshell-smart-space-goes-to-end t
      eshell-buffer-shorthand t)

(use-package eshell-git-prompt
  :ensure t
  :init (eshell-git-prompt-use-theme 'powerline))

(provide 'aec/packs/eshell)
