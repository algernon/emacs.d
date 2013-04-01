;; Last updated: <2013/04/01 13:14:59 algernon@madhouse-project.org>

(require 'hippie-exp)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-<tab>") 'hippie-expand)

(defun aec-pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
	  (0 (progn (compose-region (match-beginning 1) (match-end 1)
				    ,(make-char 'greek-iso8859-7 107))
		    nil))))))

(defun aec-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
	  1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'aec-pretty-lambdas)
(add-hook 'prog-mode-hook 'aec-add-watchwords)
