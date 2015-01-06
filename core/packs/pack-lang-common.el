;; Last updated: <2015/01/06 14:01:40 algernon@madhouse-project.org>

(use-package color-identifiers-mode
  :diminish color-identifiers-mode
  :init (global-color-identifiers-mode t))

(use-package evil-nerd-commenter
  :init (evilnc-default-hotkeys))

(use-package hippie-exp
  :bind (("M-/" . hippie-expand)
         ("C-<tab>" . hippie-expand)))

(defun aec-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'aec-add-watchwords)
(add-hook 'prog-mode-hook (lambda ()
                            (if (is-presentingp)
                                (text-scale-increase 3)
                              (use-package idle-highlight-mode
                                :init (idle-highlight-mode t))
                              (use-package smartscan
                                :init (smartscan-mode t)))))
