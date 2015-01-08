;; Last updated: <2015/01/08 10:44:52 algernon@madhouse-project.org>

(setq powerline-default-separator 'arrow)

(use-package smart-mode-line
  :ensure t
  :config (setq-default
           sml/hidden-modes '(" hl-p" " Undo-Tree" " VHl" " yas" " WS" " G-+"
                              " AC")
           sml/mode-width 'full))
