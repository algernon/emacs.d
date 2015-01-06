;; Last updated: <2015/01/06 13:07:31 algernon@madhouse-project.org>

(use-package m4-mode
  :config
  (add-to-list 'auto-mode-alist
               '("configure.\\(ac\\|in\\|scan\\)" . m4-mode)))
