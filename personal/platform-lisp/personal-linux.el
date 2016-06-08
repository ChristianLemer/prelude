;;; personal-linux.el -- Emacs init file for OS X (linux)
;;
;; Time-stamp: <2014-04-03 06:58:11 chris>
;;

;;; Commentary:

;;; Code:

;;
;; Use Chromium browser
;;
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

;;
;; Fix the dead-circumflex issue.
;;
(load-library "iso-transl")

;;
;; End
;;
(provide 'personal-linux)
;;; personal-linux.el ends here
