;;; personal-darwin.el -- Emacs init file for OS X (darwin)
;;
;; Time-stamp: <2014-04-14 18:48:10 chris>
;;

;;; Commentary:

;;; Code:

;;
;; Unbind alt to be able to use AZERTY keyboard
;; who needs alt for alternate caracters.
;;
(setq ns-alternate-modifier nil)
(setq ns-command-modifier 'meta)
(setq ns-function-modifier 'super)

;; Use OS X default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "open")
;;
;; End
;;
(provide 'personal-darwin)
;;; personal-darwin.el ends here
