;; Last updated: <2013/04/01 20:01:14 algernon@madhouse-project.org>

(packages-maybe-install '(ace-jump-mode))

(require 'ace-jump-mode)

(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o w") 'ace-jump-word-mode)
(global-set-key (kbd "C-o c") 'ace-jump-char-mode)
(global-set-key (kbd "C-o l") 'ace-jump-line-mode)
