;; Last updated: <2015/01/06 12:17:17 algernon@madhouse-project.org>

(packages-maybe-install '(clojure-mode
                          clj-refactor
                          cider
                          kibit-mode))

(add-to-list 'auto-mode-alist
             '("\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook '(lambda ()
                                (turn-on-auto-fill)
                                (paredit-mode)
                                (rainbow-delimiters-mode)
                                (aggressive-indent-mode)
                                (kibit-mode)))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))
