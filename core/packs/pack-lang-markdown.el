;; Last updated: <2015/01/06 12:18:55 algernon@madhouse-project.org>

(packages-maybe-install '(markdown-mode))

(add-to-list 'auto-mode-alist
             '("\\.\\(markdown\\|md\\)" . markdown-mode))

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'markdown-mode-hook 'turn-on-flyspell)))
