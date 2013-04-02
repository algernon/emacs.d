;; Last updated: <2013/04/02 12:32:37 algernon@madhouse-project.org>

(packages-maybe-install '(volatile-highlights highlight))
(require 'volatile-highlights)
(volatile-highlights-mode)

(require 'highlight)
(add-to-list 'load-path (concat user-emacs-directory
                                "packages/nrepl-eval-sexp-fu"))
(require 'nrepl-eval-sexp-fu)
(setq nrepl-eval-sexp-fu-flash-duration 0.5)
