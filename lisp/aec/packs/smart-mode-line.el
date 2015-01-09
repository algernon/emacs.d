;; Last updated: <2015/01/09 15:48:52 algernon@madhouse-project.org>

(setq powerline-default-separator 'curve
      powerline-default-separator-dir '(right . left))

(use-package smart-mode-line
  :ensure t
  :config (setq-default
           sml/hidden-modes '(" hl-p" " Undo-Tree" " VHl" " yas" " WS" " G-+"
                              " AC")
           sml/mode-width 'right))

(provide 'aec/packs/smart-mode-line)
