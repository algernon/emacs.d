;; Last updated: <2013/07/31 11:42:22 algernon@madhouse-project.org>

(packages-maybe-install '(clojure-mode clojure-test-mode clj-refactor))

(add-to-list* 'auto-mode-alist
              '("\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook '(lambda ()
                                (turn-on-auto-fill)
                                (paredit-mode)
                                (clojure-test-mode)))

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
