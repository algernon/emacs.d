;; Last updated: <2015/01/08 11:09:36 algernon@madhouse-project.org>

(use-package clojure-mode
  :ensure t
  :defer t
  :mode "\.cljs$"
  :init (progn
          (use-package kibit-mode
            :ensure t)

          (add-hook 'clojure-mode-hook #'turn-on-auto-fill)
          (add-hook 'clojure-mode-hook #'kibit-mode)))
