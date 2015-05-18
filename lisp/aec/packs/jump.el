;; Last updated: <2015/05/18 13:37:43 algernon@madhouse-project.org>

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

(use-package ace-window
  :ensure t
  :defer t
  :bind (("C-o C-w" . ace-window)
         ("C-x o" . ace-window)))

(provide 'aec/packs/jump)
