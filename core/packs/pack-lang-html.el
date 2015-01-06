;; Last updated: <2015/01/06 13:16:38 algernon@madhouse-project.org>

(use-package web-mode
  :init (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  :config (add-hook 'web-mode-hook '(lambda ()
                                      (turn-off-auto-fill))))
