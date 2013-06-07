;; Last updated: <2013/06/07 15:09:54 algernon@madhouse-project.org>

(add-to-list 'load-path (concat user-emacs-directory
                                "packages/hy-mode"))
(require 'hy-mode)

(add-hook 'hy-mode-hook '(lambda ()
                           (turn-on-auto-fill)
                           (paredit-mode)))

(eval-after-load 'hy-mode
  '(font-lock-add-keywords 'hy-mode
                           `(("(\\(fn\\)[\[[:space:]]"
                              (0 (progn (compose-region (match-beginning 1)
                                                        (match-end 1) "ƒ")
                                        nil))))))

(eval-after-load 'hy-mode
  '(font-lock-add-keywords 'hy-mode
                           `(("\\(lambda\\)[\[[:space:]]"
                              (0 (progn (compose-region (match-beginning 1)
                                                        (match-end 1) "λ")
                                        nil))))))
