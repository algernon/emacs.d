;; Last updated: <2013/04/05 15:43:49 algernon@madhouse-project.org>

;; dired
(require 'dired nil t)
(require 'dired-x nil t)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^CVS$\\|,v$\\|^\\.arch-ids$\\|^{arch}\\|^,,\\|^\\.git$\\|^\\.dirstamp$\\|^\\.deps$"
      dired-recursive-deletes 'top)
(set-default 'dired-omit-mode t)
(diminish 'dired-omit-mode)

(global-set-key "\C-x\C-d" 'ido-dired)

(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xf" 'find-file)

(add-hook 'dired-load-hook (function (lambda ()
                                       (load "dired-x"))))

;; recent files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode +1)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c f")  'recentf-ido-find-file)
