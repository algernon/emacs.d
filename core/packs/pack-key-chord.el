;; Last updated: <2015/01/06 16:59:33 algernon@madhouse-project.org>

(use-package key-chord
  :init (key-chord-mode 1)
  :config (progn
            (key-chord-define-global ",," 'indent-for-comment)
            (key-chord-define-global "''"     "`'\C-b")))
