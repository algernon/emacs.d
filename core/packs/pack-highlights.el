;; Last updated: <2013/04/02 22:32:53 algernon@madhouse-project.org>

(packages-maybe-install '(volatile-highlights highlight mic-paren))
(require 'volatile-highlights)
(volatile-highlights-mode)

(require 'highlight)
(add-to-list 'load-path (concat user-emacs-directory
                                "packages/nrepl-eval-sexp-fu"))
(require 'nrepl-eval-sexp-fu)
(setq nrepl-eval-sexp-fu-flash-duration 0.3)
(set-face-attribute 'nrepl-eval-sexp-fu-flash
                    nil
                    :inverse-video t
                    :weight 'bold)

(require 'mic-paren)
(paren-activate)

(set-face-attribute 'paren-face-match
                    nil
                    :inverse-video nil
                    :weight 'normal
                    :background "#454A4B")

(defun toggle-mic-paren-sexp-mode ()
  (interactive)
  (if paren-sexp-mode
      (setq-default paren-sexp-mode nil)
    (setq-default paren-sexp-mode 'match)))
(global-set-key (kbd "C-x p") 'toggle-mic-paren-sexp-mode)
