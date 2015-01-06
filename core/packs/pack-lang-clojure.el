;; Last updated: <2015/01/06 13:11:05 algernon@madhouse-project.org>

(use-package clojure-mode
  :init (add-to-list 'auto-mode-alist
                     '("\.cljs$" . clojure-mode))
  :config (progn
            (use-package kibit-mode)

            (add-hook 'clojure-mode-hook '(lambda ()
                                            (turn-on-auto-fill)
                                            (paredit-mode)
                                            (rainbow-delimiters-mode)
                                            (aggressive-indent-mode)
                                            (kibit-mode)))

            (font-lock-add-keywords
             'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                              (0 (progn (compose-region (match-beginning 1)
                                                        (match-end 1) "λ")
                                        nil)))))

            (font-lock-add-keywords
             'clojure-mode `(("\\(#\\)("
                              (0 (progn (compose-region (match-beginning 1)
                                                        (match-end 1) "ƒ")
                                        nil)))))

            (font-lock-add-keywords
             'clojure-mode `(("\\(#\\){"
                              (0 (progn (compose-region (match-beginning 1)
                                                        (match-end 1) "∈")
                                        nil)))))))
