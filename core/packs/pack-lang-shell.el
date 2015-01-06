;; Last updated: <2015/01/06 13:23:32 algernon@madhouse-project.org>

(use-package shell-mode
  :config (progn
            (setq sh-basic-offset 8
                  sh-indentation 8)

            (add-hook 'shell-mode-hook 'pcomplete-shell-setup)))
