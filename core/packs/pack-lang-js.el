;; Last updated: <2013/11/15 11:15:10 algernon@madhouse-project.org>

(when (>= emacs-major-version 24)
  (packages-maybe-install '(js2-mode skewer-mode))

  (add-to-list* 'auto-mode-alist
                '("\\.\\(js\\)" . js2-mode)))

(eval-after-load 'js
  '(progn (setq js-indent-level 2)
          ;; fixes problem with pretty function font-lock
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js-mode `(("\\(function *\\)("
                       (0 (progn (compose-region (match-beginning 1)
                                                 (match-end 1) "\u0192")
                                 nil)))))))
