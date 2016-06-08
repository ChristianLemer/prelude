;;; personal.el -- Emacs personal configuration
;;
;;

;;; Commentary:

;;; Code:

;;
;; Uses personal preludes-modules file
;;
;;(setq prelude-modules-file (expand-file-name "prelude-modules.el" prelude-personal-dir))

;;
;; Shared savefile folder
;;
(defvar prelude-personal-savefile-dir (expand-file-name "savefile" prelude-personal-dir)
  "This folder stores automatically generated files that can be shared across installations.")

;;
;; Backups and autosave in one centralized place
;;
(setq backup-directory-alist '(("." . "~/.emacs.d/personal/.backup")))

;;
;; Autosave to a single directory
;; ;;
(defun auto-save-file-name-p (filename)
  "Return a non-nil value if FILENAME is a string that could be the name of an auto-save file."
  (string-match "^autosave\..*$" (file-name-nondirectory filename)))

;; Document
(defun make-auto-save-file-name ()
  "Return the file name to use for auto-saving the current buffer."
  (concat (expand-file-name "~/.emacs.d/personal/.backup") "/"
          (if buffer-file-name
              (concat "autosave." (file-name-nondirectory buffer-file-name))
            (expand-file-name (concat "autosave.%" (buffer-name))))))
;; - http://snarfed.org/space/gnu+emacs+backup+files

;;
;; Bookmarks
;;
(require 'bookmark)
(setq bookmark-default-file (expand-file-name "bookmarks" prelude-personal-savefile-dir)
      bookmark-save-flag 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Additional Packages
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Additional Package Archives
;;
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)

;;
;; Additional Packages
;;
(prelude-ensure-module-deps
 '(
   afternoon-theme
   apache-mode
   cmake-mode
   csharp-mode
   ;; darcsum
   ;; dic-lookup-w3m
   ediff
   edit-server
   ;; elpy
   epresent
   flymake-cursor
   ;; flymake-haskell-multi
   ;; flymake-haml
   ;; flymake-hlint
   flymake-sass
   flyspell
   frame-cmds
   frame-fns
   ;; geiser
   graphviz-dot-mode
   ;; haml-mode
   ispell
   ;; jade-mode
   ;; jedi
   jinja2-mode
   markdown-mode
   mediawiki
   multi-term
   multi-web-mode
   ;; org
   org-bullets
   org-present
   ;; ox-reveal
   python-info
   ;; python-magic
   ;; pyflakes
   ;; pylint
   ;; reveal-in-finder
   solarized-theme
   ;; vc-darcs
   ;; w3m
   web-mode
   ))

;;
;; Blank mode
;;
;; (autoload 'blank-mode "blank-mode"
;;   "Toggle blank-mode" t)
;;

;;
;; Generic Browser
;;
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chrome")

;;
;; Remember The Milk Interface
;;
(add-to-list 'load-path "~/.emacs.d/personal/site-lisp/simple-rtm/lisp")
(autoload 'simple-rtm-mode "simple-rtm" "Interactive mode for Remember The Milk" t)
(eval-after-load 'simple-rtm
  '(progn
     (display-simple-rtm-tasks-mode t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Behaviour
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Prelude Guru Mode
;; (first things first)
;;
(add-hook 'prelude-prog-mode-hook
          (lambda ()
            (guru-mode -1)) t)

;;
;; Dired mode
;;
(add-hook 'dired-mode-hook
          (lambda () (dired-omit-mode)))

;;
;;  Time Stamps
;;
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Cosmetic
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Theme
;;
(disable-theme 'zenburn)
(load-theme 'solarized-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Utilities
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; ediff
;;

(add-hook 'ediff-before-setup-hook
          (lambda ()
;;            (make-frame)
            (maximize-frame-vertically))
          t )

(add-hook 'ediff-startup-hook
          (lambda ()
            (ediff-toggle-split)
            (ediff-toggle-wide-display))
          t)

(add-hook 'ediff-cleanup-hook
          (lambda ()
            (ediff-toggle-wide-display))
          t)

;; (add-hook 'ediff-quit-hook
;;           'delete-frame)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Languages
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Python
;;
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

;;
;; Haskell Mode
;;
;; (add-hook 'haskell-mode-hook 'flymake-hlint-load)

;;
;; vc-darcs mode
;;
;; (add-to-list 'vc-handled-backends 'DARCS)
;; (auoload 'vc-darcs-find-file-hook "vc-darcs")
;; (add-hook 'find-file-hooks 'vc-darcs-find-file-hook)

;;
;; darcsum mode
;;
;; (load-library "darcsum")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Other Editing Modes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; markdown mode
;;
(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

;;
;; Text Mode
;;
;; (add-hook 'text-mode-hook
;;           (lambda () (modify-syntax-entry ?_ "w")))

;; (modify-syntax-entry ?_ "w")
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Tools
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; EPresent Mode
;;
(add-hook 'epresent-mode-hook
          (lambda ()
            (whitespace-mode -1)
            (flyspell-mode -1)
            )
          t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; OS specific code
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/personal/platform-lisp")
(if (eq system-type 'darwin)
    (require 'personal-darwin))
(if (eq system-type 'gnu/linux)
    (require 'personal-linux))

;;
;; End
;;
(provide 'personal)
;;; personal.el ends here
