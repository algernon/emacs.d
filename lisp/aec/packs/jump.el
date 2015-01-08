;; Last updated: <2015/01/08 12:46:44 algernon@madhouse-project.org>

(global-unset-key (kbd "C-o"))

(use-package ace-jump-mode
  :ensure t
  :defer t
  :bind (("C-o w" . ace-jump-word-mode)
         ("C-o c" . ace-jump-char-mode)
         ("C-o l" . ace-jump-line-mode)))

(provide 'aec/packs/jump)
