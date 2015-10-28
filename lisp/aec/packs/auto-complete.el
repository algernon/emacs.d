;; Last updated: <2015/10/27 14:40:52 algernon@madhouse-project.org>

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init (progn
          (global-company-mode)
          (use-package company-emoji
            :ensure t
            :defer t
            :init (progn
                    (add-to-list 'company-backends 'company-emoji)
                    (set-fontset-font "fontset-default"
                                      '(#x1f300 . #x1f5ff) "Symbola")
                    (set-fontset-font "fontset-default"
                                      '(#x1f600 . #x1f64f) "Symbola")
                    (set-fontset-font "fontset-default"
                                      '(#x2600  . #x27bf ) "Symbola")
                    (set-fontset-font
                     t 'symbol
                     (font-spec :family "Symbola") nil 'prepend)))))

(use-package fuzzy
  :ensure t
  :defer t)

(provide 'aec/packs/auto-complete)
