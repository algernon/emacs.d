;; Last updated: <2013/04/03 10:25:18 algernon@madhouse-project.org>

(when (>= emacs-major-version 24)
  (packages-maybe-install '(yasnippet))
  (require 'yasnippet)
  (diminish 'yas-minor-mode)
  (yas-global-mode 1))
