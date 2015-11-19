(setq hy-packages '(hy-mode))

(defun hy/init-hy-mode ()
  (use-package hy-mode
    :defer t
    :config
    (progn
      (when hy-enable-fancify-symbols
        (hy/fancify-symbols #'hy-mode)))))
