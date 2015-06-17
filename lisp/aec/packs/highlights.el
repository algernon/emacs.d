;; Last updated: <2015/06/17 09:31:57 algernon@madhouse-project.org>

(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :init (progn
	  (require 'volatile-highlights)
	  (volatile-highlights-mode t)))

(use-package highlight
  :ensure t)

(use-package mic-paren
  :ensure t
  :defer t
  :init (progn
          (defun toggle-mic-paren-sexp-mode ()
            (interactive)
            (if paren-sexp-mode
                (setq-default paren-sexp-mode nil)
              (setq-default paren-sexp-mode 'match)))

          (paren-activate))
  :bind (("C-x p" . toggle-mic-paren-sexp-mode))
  :config (set-face-attribute 'paren-face-match
                              nil
                              :inverse-video nil
                              :weight 'normal
                              :background "#454A4B"))

(use-package nrepl-eval-sexp-fu
  :ensure t
  :defer t
  :load-path "packages/nrepl-eval-sexp-fu"
  :config (progn
            (set-face-attribute 'nrepl-eval-sexp-fu-flash
                                nil
                                :foreground nil
                                :background nil
                                :inverse-video t
                                :weight 'bold)
            (setq nrepl-eval-sexp-fu-flash-duration 0.3)))

(use-package hi-lock
  :ensure t
  :diminish hi-lock-mode)

(provide 'aec/packs/highlights)
