;; Last updated: <2015/01/06 13:22:10 algernon@madhouse-project.org>

(use-package markdown-mode
  :init (add-to-list 'auto-mode-alist
                     '("\\.\\(markdown\\|md\\)" . markdown-mode))
  :config (eval-after-load "ispell"
            '(when (executable-find ispell-program-name)
               (add-hook 'markdown-mode-hook 'turn-on-flyspell))))
