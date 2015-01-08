;; Last updated: <2015/01/08 09:39:54 algernon@madhouse-project.org>

(global-unset-key (kbd "C-o"))

(use-package ace-jump-mode
  :ensure t
  :defer t
  :bind (("C-o w" . ace-jump-word-mode)
         ("C-o c" . ace-jump-char-mode)
         ("C-o l" . ace-jump-line-mode)))
