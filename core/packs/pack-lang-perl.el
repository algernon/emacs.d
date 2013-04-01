;; Last updated: <2013/04/02 00:04:46 algernon@madhouse-project.org>

(defalias 'perl-mode 'cperl-mode)

(autoload 'perl-mode "cperl-mode" "Major mode for editing Perl scripts.")

(add-to-list* 'auto-mode-alist
              '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))

(defun algernon-cperl-style ()
  "Algernon's Perl Coding Style."
  (interactive)
  (setq cperl-tab-always-indent t)
  (setq cperl-indent-level 8)
  (setq cperl-brace-offset 0)
  (setq cperl-continued-brace-offset 0)
  (setq cperl-extra-newline-before-brace nil)
  (setq cperl-extra-newline-before-brace-multiline nil)
  (setq cperl-continued-statement-offset 8)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-merge-trailing-else t)
  (setq cperl-close-paren-offset -8))

(setq cperl-electric-keywords nil
      cperl-electric-lbrace-space nil
      cperl-electric-parens nil
      cperl-hairy nil
      cperl-info-on-command-no-prompt t)

(add-hook 'cperl-mode-hook '(lambda ()
                              (algernon-cperl-style)
                              (auto-fill-mode)))
