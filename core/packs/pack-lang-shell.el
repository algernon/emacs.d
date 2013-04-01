;; Last updated: <2013/04/01 12:46:51 algernon@madhouse-project.org>

(setq sh-basic-offset 8
      sh-indentation 8)

(add-hook 'shell-mode-hook 'pcomplete-shell-setup)
