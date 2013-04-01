;; Last updated: <2013/04/02 00:04:39 algernon@madhouse-project.org>

(packages-maybe-install '(markdown-mode))

(add-to-list* 'auto-mode-alist
              '("\\.markdown" . markdown-mode)
              '("\\.md" . markdown-mode))

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'markdown-mode-hook 'turn-on-flyspell)))
