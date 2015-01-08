;; Last updated: <2015/01/08 10:39:40 algernon@madhouse-project.org>

(setq-default sh-basic-offset 8
              sh-indentation 8)

(add-hook 'shell-mode-hook #'pcomplete-shell-setup)
