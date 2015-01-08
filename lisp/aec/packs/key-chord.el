;; Last updated: <2015/01/08 12:46:54 algernon@madhouse-project.org>

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1)
  :config (progn
            (key-chord-define-global ",," #'indent-for-comment-foo)
            (key-chord-define-global "''" "`'\C-b")))

(provide 'aec/packs/key-chord)
