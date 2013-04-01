;; Last updated: <2013/04/02 00:01:56 algernon@madhouse-project.org>

(defun aec-mail-hdr (key headers)
  (let ((val (or (cdr (assq
                       key headers))"")))
    val))

(defun gnus-user-format-function-p (header)
  (let ((xdpr
         (aec-mail-hdr 'X-Debian-PR-Package (mail-header-extra
                                             header)))
        (rcc
         (aec-mail-hdr 'Resent-CC (mail-header-extra header))))
    (if (and
         (string-match "\\(unknown.package\\)" rcc)
         (not (string-match "src:" xdpr)))
        (concat "[" (format "%-15s" "UNKNOWN") "] ")
      (if (> (length xdpr) 0)
          (if (> (length xdpr) 15)
              (concat "[" (substring xdpr 0 12) "...] ")
            (concat "[" (format "%-15s" xdpr) "] "))
        ""))))

(setq message-default-headers
      (concat
       "X-Marvin: Life, loathe it or ignore it, you can't like it\n"
       "X-Palindrome: 'Naomi, sex at noon taxes.' I moan.
 Never odd or even.
 A man, a plan, a canal, Panama.
 Madam, I'm Adam.
 Sit on a potato pan, Otis.
                -- The Mad Palindromist\n"
       ))

(setq gnus-extra-headers
      '(To Cc Keywords Gcc Newsgroups X-Debian-PR-Package Resent-CC
        Mail-Followup-To))
(setq nnmail-extra-headers gnus-extra-headers)
