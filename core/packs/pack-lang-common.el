;; Last updated: <2013/04/01 18:24:56 algernon@madhouse-project.org>

(packages-maybe-install '(idle-highlight-mode))

(require 'hippie-exp)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-<tab>") 'hippie-expand)

(defun aec-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
	  1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'aec-add-watchwords)
(add-hook 'prog-mode-hook (lambda ()
			    (idle-highlight-mode t)))
