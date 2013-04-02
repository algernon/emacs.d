;; Last updated: <2013/04/02 13:25:07 algernon@madhouse-project.org>

(packages-maybe-install '(volatile-highlights highlight mic-paren))
(require 'volatile-highlights)
(volatile-highlights-mode)

(require 'highlight)
(add-to-list 'load-path (concat user-emacs-directory
                                "packages/nrepl-eval-sexp-fu"))
(require 'nrepl-eval-sexp-fu)
(setq nrepl-eval-sexp-fu-flash-duration 0.5)

(require 'mic-paren)
(paren-activate)

(defun toggle-mic-paren-sexp-mode ()
  (interactive)
  (if paren-sexp-mode
      (setq-default paren-sexp-mode nil)
    (setq-default paren-sexp-mode 'match)))
(global-set-key (kbd "C-x p") 'toggle-mic-paren-sexp-mode)
