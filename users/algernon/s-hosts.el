;; Last updated: <2015/01/08 11:16:00 algernon@madhouse-project.org>

(let ((user-host-file (concat aec-user-dir "/hosts/" system-name ".el")))
  (when (file-exists-p user-host-file)
    (load-file-sans-extension user-host-file)))
