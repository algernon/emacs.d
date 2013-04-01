;; Last updated: <2013/04/01 12:22:51 algernon@madhouse-project.org>

(require 'time-stamp)

(setq time-stamp-active t)
(setq time-stamp-start "[lL]ast [uU]pdated:[ 	]+\\\\?[\"<]+")
(setq time-stamp-line-limit 20)
(setq time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
				user-mail-address))
(add-hook 'write-file-hooks '(lambda ()
			       (time-stamp)))
