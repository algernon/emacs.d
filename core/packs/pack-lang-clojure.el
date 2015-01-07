;; Last updated: <2015/01/07 11:15:58 algernon@madhouse-project.org>

(use-package clojure-mode
  :init (add-to-list 'auto-mode-alist
                     '("\.cljs$" . clojure-mode))
  :config (progn
            (use-package kibit-mode)

            (add-hook 'clojure-mode-hook
                      '(lambda ()
                         (turn-on-auto-fill)
                         (paredit-mode)
                         (rainbow-delimiters-mode)
                         (aggressive-indent-mode)
                         (kibit-mode)
                         (prettify-symbols-mode)))))
