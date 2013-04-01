;; Last updated: <2013/04/02 01:03:27 algernon@madhouse-project.org>

(when (>= emacs-major-version 24)
  (packages-maybe-install '(yasnippet))
  (require 'yasnippet)
  (yas-global-mode 1))
