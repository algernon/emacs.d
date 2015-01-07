;; Last updated: <2015/01/07 11:25:09 algernon@madhouse-project.org>

(use-package anzu
  :diminish anzu-mode
  :init (global-anzu-mode t))

(use-package fold-this
  :bind (("C-c C-f" . fold-this-all)
         ("C-c C-F" . fold-this)
         ("C-c M-f" . fold-this-unfold-all)))

(use-package hungry-delete
  :init (global-hungry-delete-mode t))

(use-package aggressive-indent)

(use-package abbrev
  :diminish abbrev-mode)

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package flyspell
  :diminish (flyspell-mode . " α"))

(use-package fancy-narrow
  :diminish fancy-narrow-mode
  :init (fancy-narrow-mode))
