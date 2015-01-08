;; Last updated: <2015/01/08 16:48:04 algernon@madhouse-project.org>

(use-package guide-key
  :ensure t
  :diminish guide-key-mode
  :init (guide-key-mode 1)
  :config (setq
           guide-key/guide-key-sequence '("C-x" "C-c" "C-o" "C-w")
           guide-key/recursive-key-sequence-flag t
           guide-key/popup-window-position 'bottom))

(provide 'aec/packs/guide-key)
