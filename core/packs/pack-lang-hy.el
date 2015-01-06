;; Last updated: <2015/01/06 13:17:31 algernon@madhouse-project.org>

(use-package hy-mode
  :config (progn
            (add-hook 'hy-mode-hook '(lambda ()
                                       (turn-on-auto-fill)
                                       (paredit-mode)))

            (font-lock-add-keywords 'hy-mode
                                    `(("(\\(fn\\)[\[[:space:]]"
                                       (0 (progn (compose-region (match-beginning 1)
                                                                 (match-end 1) "ƒ")
                                                 nil)))))

            (font-lock-add-keywords 'hy-mode
                                    `(("\\(lambda\\)[\[[:space:]]"
                                       (0 (progn (compose-region (match-beginning 1)
                                                                 (match-end 1) "λ")
                                                 nil)))))))
