;; Last updated: <2013/04/01 18:57:24 algernon@madhouse-project.org>

(packages-maybe-install '(refheap))
(if (file-exists-p "~/.refheap-pass.el")
    (load "~/.refheap-pass.el"))
