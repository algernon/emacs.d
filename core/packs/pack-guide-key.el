;; Last updated: <2015/01/06 12:57:56 algernon@madhouse-project.org>

(use-package guide-key
  :init (guide-key-mode 1)
  :config (setq
           guide-key/guide-key-sequence '("C-x" "C-c" "C-o")
           guide-key/recursive-key-sequence-flag t
           guide-key/popup-window-position 'bottom))
