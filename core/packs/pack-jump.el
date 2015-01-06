;; Last updated: <2015/01/06 13:07:10 algernon@madhouse-project.org>

(global-unset-key (kbd "C-o"))

(use-package ace-jump-mode
  :bind (("C-o w" . ace-jump-word-mode)
         ("C-o c" . ace-jump-char-mode)
         ("C-o l" . ace-jump-line-mode)))
