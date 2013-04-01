;; Last updated: <2013/04/01 14:00:24 algernon@madhouse-project.org>

(packages-maybe-install '(clojure-mode clojure-test-mode))

(add-to-list* 'auto-mode-alist
	      '("\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook '(lambda ()
				(turn-on-auto-fill)
				(paredit-mode)
				(clojure-test-mode)))

(defun aec-pretty-fn ()
  (font-lock-add-keywords nil `(("(\\(\\<fn\\>\\)"
				 (0 (progn (compose-region
					    (match-beginning 1)
					    (match-end 1)
					    "\u0192"
					    'decompose-region)))))))
(add-hook 'clojure-mode-hook 'aec-pretty-fn)
(add-hook 'clojurescript-mode-hook 'aec-pretty-fn)
