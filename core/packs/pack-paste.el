;; Last updated: <2015/01/06 13:29:29 algernon@madhouse-project.org>

(use-package refheap
  :config (if (file-exists-p "~/.refheap-pass.el")
              (load "~/.refheap-pass.el")))
