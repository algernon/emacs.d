;; Last updated: <2013/04/02 00:04:53 algernon@madhouse-project.org>

(add-to-list* 'auto-mode-alist
              '("README$\\|NEWS$\\|INSTALL$\\|AUTHORS$\\|THANKS$"
                . text-mode))

(setq flyspell-default-dictionary "british")

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'text-mode-hook 'turn-on-flyspell)))

(add-hook 'text-mode-hook '(lambda ()
                             (turn-on-auto-fill)))
