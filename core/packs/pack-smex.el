;; Last updated: <2015/01/08 10:45:01 algernon@madhouse-project.org>

(use-package smex
  :ensure t
  :init (progn
          (setq smex-save-file (concat user-emacs-directory ".smex-items"))
          (smex-initialize))
  :bind (("M-x" . smex)))
