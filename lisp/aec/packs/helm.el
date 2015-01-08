;; Last updated: <2015/01/08 12:45:52 algernon@madhouse-project.org>

(use-package helm
  :ensure t
  :init (require 'helm-config)
  :bind (("C-c h" . helm-command-prefix))
  :config (progn
            (when (executable-find "curl")
              (setq helm-google-suggest-use-curl-p t))

            (setq helm-split-window-in-side-p           t
                  helm-buffers-fuzzy-matching           t
                  helm-move-to-line-cycle-in-source     t
                  helm-ff-search-library-in-sexp        t
                  helm-ff-file-name-history-use-recentf t)

            (define-key helm-command-map (kbd "o")     #'helm-occur)
            (define-key helm-command-map (kbd "g")     #'helm-do-grep)
            (define-key helm-command-map (kbd "C-c w") #'helm-wikipedia-suggest)
            (define-key helm-command-map (kbd "SPC")   #'helm-all-mark-rings)))

(provide 'aec/packs/helm)
