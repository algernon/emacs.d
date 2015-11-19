(defun hy/fancify-symbols (mode)
  "Pretty symbols for Hy's `fn', sets and others."
  (font-lock-add-keywords mode
                          `(("(\\(fn\\)[\[[:space:]]"
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "λ"))))
                            ("(\\(lambda\\)[\[[:space:]]"
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "λ"))))
                            ("(\\(partial\\)[\[[:space:]]"
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "Ƥ"))))
                            ("\\(#\\){"
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "∈")))))))
