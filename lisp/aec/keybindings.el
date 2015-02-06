;; Last updated: <2015/02/06 09:51:45 algernon@madhouse-project.org>

(use-package key-chord
  :ensure t
  :init (key-chord-mode 1)
  :config (progn
            (key-chord-define-global ",," #'indent-for-comment)
            (key-chord-define-global "''" "`'\C-b")))

;; Misc. bindigs
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)
    (git-gutter)))

(global-set-key "\C-cg" #'goto-line)
(global-set-key [remap goto-line] #'goto-line-with-feedback)

(global-unset-key "\C-z")
(global-set-key "\C-m" #'newline-and-indent)

; Because a space after a comma is just a waste of a keystroke.
(global-set-key (kbd ",") (lambda() (interactive) (insert ", ")))

;; Killing, copying and yanking
(global-unset-key "\C-xk")
(global-set-key "\C-xkk" '(lambda ()
                            "Kill the current buffer."
                            (interactive)
                            (kill-buffer (buffer-name))))
(global-set-key "\C-xka" #'kill-buffer)
(global-unset-key "\C-w")
(global-unset-key "\C-y")
(global-set-key "\C-wc" #'copy-region-as-kill)
(global-set-key "\C-wt" #'kill-region)
(global-set-key "\C-wp" #'yank)
(global-set-key "\C-wx" #'delete-region)

(use-package hydra
  :ensure t
  :init
  (progn
    ;; Text scaling
    (defhydra hydra-zoom (global-map "<f2>")
      "zoom"
      ("g" text-scale-increase "in")
      ("l" text-scale-decrease "out"))

    (key-chord-define-global "tt" 'hydra-zoom/body)))

;; Searching
(setq lazy-highlight-cleanup nil)

(global-set-key (kbd "C-s") #'isearch-forward-regexp)
(global-set-key (kbd "C-r") #'isearch-backward-regexp)
(global-set-key (kbd "M-%") #'query-replace-regexp)
(global-set-key (kbd "C-M-s") #'isearch-forward)
(global-set-key (kbd "C-M-r") #'isearch-backward)
(global-set-key (kbd "C-M-%") #'query-replace)
(global-set-key (kbd "C-c C-c") #'lazy-highlight-cleanup)

(global-set-key (kbd "C-x C-i") #'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") #'ido-find-file-other-window)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-S-<left>") #'windmove-left)
(global-set-key (kbd "C-S-<right>") #'windmove-right)
(global-set-key (kbd "C-S-<up>") #'windmove-up)
(global-set-key (kbd "C-S-<down>") #'windmove-down)
(global-set-key (kbd "C-x O")
                (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o")
                (lambda () (interactive) (other-window 2))) ;; forward two

;; Editing commands
(global-set-key (kbd "C-c q") #'join-line)
(global-set-key (kbd "C-c k") #'delete-indentation)

(defun top-join-line ()
  "Join the current line with the line beneath it."
  (interactive)
  (delete-indentation 1))

(global-set-key (kbd "M-^") #'top-join-line)

(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                #'prelude-move-beginning-of-line)

(provide 'aec/keybindings)
