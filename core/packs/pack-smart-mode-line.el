;; Last updated: <2015/01/07 14:55:53 algernon@madhouse-project.org>

(setq powerline-default-separator 'arrow)

(use-package smart-mode-line
  :config (setq-default
           sml/hidden-modes '(" hl-p" " Undo-Tree" " VHl" " yas" " WS" " G-+"
                              " AC")
           sml/mode-width 'full))
