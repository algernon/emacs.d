;; Last updated: <2015/01/07 14:29:05 algernon@madhouse-project.org>

(add-to-list 'auto-mode-alist
                     '("README$\\|NEWS$\\|INSTALL$\\|AUTHORS$\\|THANKS$"
                       . text-mode))

(setq flyspell-default-dictionary "british")

(use-package ispell
  :init (when (executable-find ispell-program-name)
          (add-hook 'text-mode-hook 'turn-on-flyspell)))

(add-hook 'text-mode-hook '(lambda ()
                             (turn-on-auto-fill)))

(use-package sentence-highlight
  :diminish sentence-highlight-mode
  :init
  (add-hook 'text-mode-hook 'sentence-highlight-mode))
