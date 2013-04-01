;; Last updated: <2013/04/01 12:22:45 algernon@madhouse-project.org>

(packages-maybe-install '(smex))

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
