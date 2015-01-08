;; Last updated: <2015/01/08 12:52:11 algernon@madhouse-project.org>

(defun algernon-cperl-style ()
  "Algernon's Perl Coding Style."
  (interactive)

  (setq cperl-electric-keywords nil
        cperl-electric-lbrace-space nil
        cperl-electric-parens nil
        cperl-hairy nil
        cperl-info-on-command-no-prompt t
        cperl-tab-always-indent t
        cperl-indent-level 8
        cperl-brace-offset 0
        cperl-continued-brace-offset 0
        cperl-extra-newline-before-brace nil
        cperl-extra-newline-before-brace-multiline nil
        cperl-continued-statement-offset 8
        cperl-indent-parens-as-block t
        cperl-merge-trailing-else t
        cperl-close-paren-offset -8))

(use-package cperl-mode
  :defer t
  :mode "\\.\\([pP][Llm]\\|al\\)\\'"
  :init (progn
          (add-hook 'cperl-mode-hook #'algernon-cperl-style)
          (add-hook 'cperl-mode-hook #'turn-on-auto-fill)))

(provide 'aec/packs/lang/perl)
