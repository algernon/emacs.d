;; Last updated: <2015/01/09 10:51:55 algernon@madhouse-project.org>

(setq sentence-end-double-space nil
      diff-switches "-u")

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init (global-anzu-mode t))

(use-package fold-this
  :ensure t
  :defer t
  :bind (("C-c C-f" . fold-this-all)
         ("C-c C-F" . fold-this)
         ("C-c M-f" . fold-this-unfold-all)))

(use-package hungry-delete
  :ensure t
  :init (global-hungry-delete-mode t))

(use-package abbrev
  :diminish abbrev-mode)

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package flyspell
  :ensure t
  :defer t
  :diminish (flyspell-mode . " "))

(defun fancy-narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, subtree, or defun, whichever applies
first.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (fancy-narrow-active-p) (not p)) (fancy-widen))
        ((region-active-p)
         (fancy-narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode) (org-fancy-narrow-to-subtree))
        (t (fancy-narrow-to-defun))))

(use-package fancy-narrow
  :ensure t
  :defer t
  :diminish fancy-narrow-mode
  :bind (("C-x n i" . fancy-narrow-or-widen-dwim))
  :idle (fancy-narrow-mode))

(use-package whitespace
  :ensure t
  :diminish whitespace-mode
  :init (dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
          (add-hook hook #'whitespace-mode))
  :config (setq whitespace-line-column 80
                whitespace-style '(face trailing lines-tail tabs)))

(use-package writeroom-mode
  :ensure t
  :defer t
  :bind (("C-w r" . writeroom-mode))
  :config (progn
            (setq writeroom-fullscreen-effect 'maximized)
            (key-chord-define-global "wr" 'writeroom-mode)))

(use-package centered-window-mode
  :ensure t
  :bind (("C-w w" . centered-window-mode))
  :init (centered-window-mode))

(provide 'aec/packs/edit)
