;; Last updated: <2013/10/15 21:25:25 algernon@madhouse-project.org>

(packages-maybe-install '(web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook '(lambda ()
                            (turn-off-auto-fill)))
