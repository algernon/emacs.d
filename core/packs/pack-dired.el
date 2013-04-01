;; Last updated: <2013/04/01 12:37:14 algernon@madhouse-project.org>

(require 'dired nil t)
(require 'dired-x nil t)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^CVS$\\|,v$\\|^\\.arch-ids$\\|^{arch}\\|^,,\\|^\\.git$"
      dired-recursive-deletes 'top)

(global-set-key "\C-x\C-d" 'ido-dired)

(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xf" 'find-file)

(add-hook 'dired-load-hook (function (lambda ()
				       (dired-omit-mode)
				       (load "dired-x"))))
