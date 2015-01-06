;; Last updated: <2015/01/06 15:58:10 algernon@madhouse-project.org>

(setq aec-core-pack-dir (concat aec-core-dir "/packs"))
(add-to-list 'load-path aec-core-pack-dir)

(mapc 'load-file-sans-extension
      (directory-files aec-core-pack-dir nil "^[^#].*el$"))
