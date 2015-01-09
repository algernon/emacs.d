;; Last updated: <2015/01/09 10:51:16 algernon@madhouse-project.org>

(use-package color-identifiers-mode
  :ensure t
  :diminish color-identifiers-mode
  :init (global-color-identifiers-mode t))

(use-package evil-nerd-commenter
  :ensure t
  :defer t
  :idle (evilnc-default-hotkeys))

(use-package hippie-exp
  :ensure t
  :defer t
  :bind (("M-/" . hippie-expand)
         ("C-<tab>" . hippie-expand)))

(use-package aggressive-indent
  :ensure t
  :defer t
  :diminish (aggressive-indent-mode . " ")
  :init
  (dolist (hook '(clojure-mode-hook emacs-lisp-mode-hook hy-mode-hook))
    (add-hook hook #'aggressive-indent-mode)))

(use-package idle-highlight-mode
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook #'idle-highlight-mode))

(use-package smartscan
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook #'smartscan-mode))

(defun aec-presenting-text-scale ()
  "Increase text scale when in presenting mode."

  (text-scale-increase 3))

(if (is-presentingp)
    (add-hook 'prog-mode-hook #'aec-presenting-text-scale))

(defun aec-add-watchwords ()
  "Add FIXME, TODO and other keywords to font-lock, with a
warning face."

  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook #'aec-add-watchwords)

(use-package flycheck
  :ensure t
  :defer t
  :diminish flycheck-mode
  :init (add-hook 'after-init-hook #'global-flycheck-mode)
  :config (progn
            (setq flycheck-indication-mode 'right-fringe)))

(use-package flycheck-clojure
  :ensure t
  :defer t)

(use-package flycheck-pos-tip
  :ensure t
  :defer t
  :init (eval-after-load 'flycheck
          '(setq
            flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(provide 'aec/packs/lang/common)
