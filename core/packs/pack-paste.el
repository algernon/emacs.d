;; Last updated: <2015/01/08 10:44:39 algernon@madhouse-project.org>

(use-package refheap
  :ensure t
  :defer t
  :config (if (file-exists-p "~/.refheap-pass.el")
              (load "~/.refheap-pass.el")))
