;; Last updated: <2015/05/18 12:37:27 algernon@madhouse-project.org>

(global-unset-key (kbd "C-o"))

(use-package avy
  :ensure t
  :defer t
  :config (avy-setup-default)
  :bind (("C-o w" . avy-goto-word-1)
         ("C-o c" . avy-goto-char)
         ("C-o l" . avy-goto-line)
         ("C-c g" . avy-goto-line)
         ("M-g g" . avy-goto-line)
         ("M-g M-g" . avy-goto-line)))

(provide 'aec/packs/jump)
