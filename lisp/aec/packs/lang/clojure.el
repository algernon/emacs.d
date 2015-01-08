;; Last updated: <2015/01/08 15:25:09 algernon@madhouse-project.org>

(use-package clojure-mode
  :ensure t
  :defer t
  :mode "\.cljs$"
  :init (progn
          (use-package kibit-mode
            :disabled t
            :ensure t)

          (add-hook 'clojure-mode-hook #'turn-on-auto-fill)
          (add-hook 'clojure-mode-hook #'kibit-mode)))

(provide 'aec/packs/lang/clojure)
