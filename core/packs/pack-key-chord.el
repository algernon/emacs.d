;; Last updated: <2015/01/08 09:40:42 algernon@madhouse-project.org>

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1)
  :config (progn
            (key-chord-define-global ",," #'indent-for-comment-foo)
            (key-chord-define-global "''" "`'\C-b")))
