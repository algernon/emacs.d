;; Last updated: <2013/04/01 23:43:45 algernon@madhouse-project.org>

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

(global-set-key "\C-cg" 'goto-line)
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-unset-key "\C-z")
(global-set-key "\C-m" 'newline-and-indent)

;; Killing, copying and yanking
(global-unset-key "\C-xk")
(global-set-key "\C-xkk" '(lambda ()
			    "Kill the current buffer."
			    (interactive)
			    (kill-buffer (buffer-name))))
(global-set-key "\C-xka" 'kill-buffer)
(global-unset-key "\C-w")
(global-unset-key "\C-y")
(global-set-key "\C-wc" 'copy-region-as-kill)
(global-set-key "\C-wt" 'kill-region)
(global-set-key "\C-wp" 'yank)
(global-set-key "\C-wx" 'delete-region)

;; Text scaling
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-<kp-add>") 'text-scale-increase)
(define-key global-map (kbd "C-<kp-subtract>") 'text-scale-decrease)

(global-set-key (vector (list 'control mouse-wheel-up-event))
		'(lambda () (interactive) (text-scale-decrease 1)))
(global-set-key (vector (list 'control mouse-wheel-down-event))
		'(lambda () (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-<down-mouse-2>")
		'(lambda () (interactive) (text-scale-adjust 0)))

;; Searching
(setq lazy-highlight-cleanup nil)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)
(global-set-key (kbd "C-c C-c") 'lazy-highlight-cleanup)

(global-set-key (kbd "C-x C-i") 'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>") 'windmove-up)
(global-set-key (kbd "C-S-<down>") 'windmove-down)
(global-set-key (kbd "C-x O")
		(lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o")
		(lambda () (interactive) (other-window 2))) ;; forward two

;; Editing commands
(global-set-key (kbd "C-c q") 'join-line)

;; Paredit additions
(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(eval-after-load "paredit"
  '(define-key paredit-mode-map (kbd "M-)")
     'paredit-wrap-round-from-behind))
