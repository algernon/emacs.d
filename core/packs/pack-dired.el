;; Last updated: <2013/04/01 17:11:53 algernon@madhouse-project.org>

(require 'dired nil t)
(require 'dired-x nil t)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^CVS$\\|,v$\\|^\\.arch-ids$\\|^{arch}\\|^,,\\|^\\.git$\\|^\\.dirstamp$"
      dired-recursive-deletes 'top)
(set-default 'dired-omit-mode t)

(global-set-key "\C-x\C-d" 'ido-dired)

(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xf" 'find-file)

(add-hook 'dired-load-hook (function (lambda ()
				       (load "dired-x"))))
