;; Last updated: <2015/01/08 11:08:25 algernon@madhouse-project.org>

;; dired
(use-package dired
  :init (progn
          (use-package dired-x)
          (use-package dired-details+)
          (use-package diredful
            :load-path "packages/")
          (add-hook 'dired-mode-hook #'dired-omit-mode))
  :config (progn
            (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^CVS$\\|,v$\\|^\\.arch-ids$\\|^{arch}\\|^,,\\|^\\.git$\\|^\\.dirstamp$\\|^\\.deps$"
                  dired-recursive-deletes 'top
                  dired-omit-mode t
                  dired-details-hidden-string "[...] "))
  :bind (("C-x C-d" . ido-dired)
         ("C-x C-j" . dired-jump)
         ("C-x f" . find-file)))

(defun aec-dired-x-load ()
  "Load dired-x"

  (load "dired-x"))

(use-package dired-x
  :defer t
  :init (add-hook 'dired-load-hook #'aec-dired-x-load))

(defadvice dired-omit-startup (after diminish-dired-omit activate)
          "Make sure to remove \"Omit\" from the modeline."
          (diminish 'dired-omit-mode) dired-mode-map)

;; recent files
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(use-package recentf
  :ensure t
  :init (progn
          (setq recentf-max-saved-items 200
                recentf-max-menu-items 15
                recentf-exclude '("\\.ido\\.last$"
                                  "^/usr/"
                                  "\\.emacs\\.d/elpa/"))
          (recentf-mode +1))
  :bind (("C-c f" . recentf-ido-find-file)))

;; uniquify
(use-package uniquify
  :init (setq uniquify-buffer-name-style 'forward
              uniquify-separator "/"
              uniquify-after-kill-buffer-p t
              uniquify-ignore-buffers-re "^\\*"))

;; neotree
(use-package neotree
  :ensure t
  :defer t
  :bind (("C-x n t" . neotree-toggle)))
