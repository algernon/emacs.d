;; Last updated: <2015/01/08 12:52:03 algernon@madhouse-project.org>

(use-package markdown-mode
  :ensure t
  :defer t
  :mode "\\.\\(markdown\\|md\\)"
  :init (add-hook 'markdown-mode-hook #'turn-on-flyspell))

(provide 'aec/packs/lang/markdown)