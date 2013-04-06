;; Last updated: <2013/04/06 23:45:09 algernon@madhouse-project.org>

;; dired
(packages-maybe-install '(dired-details+))
(require 'dired)
(require 'dired-x)
(require 'dired-details+)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^CVS$\\|,v$\\|^\\.arch-ids$\\|^{arch}\\|^,,\\|^\\.git$\\|^\\.dirstamp$\\|^\\.deps$"
      dired-recursive-deletes 'top)
(set-default 'dired-omit-mode t)
(setq dired-details-hidden-string "[...] ")

(global-set-key "\C-x\C-d" 'ido-dired)

(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xf" 'find-file)

(add-hook 'dired-load-hook (function (lambda ()
                                       (load "dired-x"))))

(defadvice dired-omit-startup (after diminish-dired-omit activate)
          "Make sure to remove \"Omit\" from the modeline."
          (diminish 'dired-omit-mode) dired-mode-map)

;; recent files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15
      recentf-exclude '("\\.ido\\.last$"
                        "^/usr/"
                        (concat "^" (expand-file-name (concat
                                                       user-emacs-directory
                                                       "elpa/")))))

(recentf-mode +1)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c f")  'recentf-ido-find-file)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")
