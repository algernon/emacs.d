;; Last updated: <2015/01/06 13:30:30 algernon@madhouse-project.org>

(use-package smex
  :init (progn
          (setq smex-save-file (concat user-emacs-directory ".smex-items"))
          (smex-initialize))
  :bind (("M-x" . smex)))
