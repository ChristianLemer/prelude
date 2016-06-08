;;; personal-wind32.el -- Emacs init for Windows OS
;;
;; Time-stamp: <2014-02-21 09:14:29 chris>
;;

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Remove windows specific font-dialogs
;;
(setq w32-use-w32-font-dialog nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Try to improve slow performance on windows
;;
(setq w32-get-true-file-attributes nil)

;;
;; Configure unix shell
;;

;; (setq exec-path (cons "C:/PortableApps/PortableApps/emacs-24.3/bin" exec-path))
;; (setenv "PATH" (concat "C:\\PortableApps\\PortableApps\\emacs-24.3\\bin;" (getenv "PATH")))

;;
;; The Haskell Platform, with the very first version of cabal
;;
;(setq exec-path (cons "C:/PortableApps/PortableApps/HaskellPlatform/bin" exec-path))
;(setenv "PATH" (concat "C:\\PortableApps\\PortableApps\\HaskellPlatform\\bin;" (getenv "PATH")))

;;
;; Cabal packages
;;
;(setq exec-path (cons "C:/Users/clemer/AppData/Roaming/cabal/bin" exec-path))
;(setenv "PATH" (concat "C:\\Users\\clemer\\AppData\\Roaming\\cabal\\bin;" (getenv "PATH")))

;;
;; Posix Distribution
;;
;(setq exec-path (cons "C:/PortableApps/PortableApps/MinGW/msys/1.0/bin" exec-path))
;(setenv "PATH" (concat"C:\\PortableApps\\PortableApps\\MinGW\\msys\\1.0\\bin;" (getenv "PATH")))

(setq exec-path (cons "C:/Cygwin/bin" exec-path))
(setenv "PATH" (concat "C:\\Cygwin\\bin;" (getenv "PATH")))

;;
;; NT-emacs assumes a Windows command shell, which you change
;; here.
;;
(setq process-coding-system-alist '(("bash" . undecided-unix)))
(setq w32-quote-process-args ?\")
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

;;
;; This removes unsightly ^M characters that would otherwise
;; appear in the output of java applications.
;;
;;
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

;;
;;
;; End
;;
(provide 'personal-win32)
;;; personal-win32.el ends here
