;; Last updated: <2015/01/08 12:52:25 algernon@madhouse-project.org>

(setq-default sh-basic-offset 8
              sh-indentation 8)

(add-hook 'shell-mode-hook #'pcomplete-shell-setup)

(provide 'aec/packs/lang/shell)
