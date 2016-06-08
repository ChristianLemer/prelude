;;; personal-org.el -- Emacs init for org-mode
;;

;;; Commentary:

;;; Code:

;;
;; File
;;
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;
;; Keybindings
;;
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)

;;
;; Font Lock
;;
(add-hook 'org-mode-hook 'turn-on-font-lock)

;;
;; Indent and Auto-fill Mode
;;
(add-hook 'org-mode-hook 'auto-fill-mode)

;;
;; Org Mode Hook
;;
(add-hook 'org-mode-hook
          (lambda()
            ;;_ as part of the word
            (modify-syntax-entry ?_ "w" org-mode-syntax-table)
            ;; hide leading stars
            (setq org-hide-leading-stars t)
            ;; do not start folded
            ;; (setq org-startup-folded nil)
            (setq org-agenda-custom-commands
                  '(("f" occur-tree "FIXME")))
            )
          )
;;
;; Hyperlinks
;;
(setq org-link-abbrev-alist
      '(("google" . "http://www.google.com/search?q=")))

;;
;; TODO
;;
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")
        (sequence "|" "CANCELED(x)" "ONHOLD(h)")))
;; (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "PROJECT(P@)" "OPEN(O@)" "|" "CANCELLED(c@/!)")))

;; (setq org-todo-state-tags-triggers
;;       '(("CANCELLED" ("CANCELLED" . t))
;;         ("WAITING" ("WAITING" . t) ("NEXT"))
;;         ("SOMEDAY" ("WAITING" . t))
;;         (done ("NEXT") ("WAITING"))
;;         ("TODO" ("WAITING") ("CANCELLED"))
;;         ("STARTED" ("WAITING"))
;;         ("PROJECT" ("CANCELLED") ("PROJECT" . t))))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("STARTED" :foreground "yellow" :weight bold)
        ("DONE" :foreground "green" :weight bold)
        ("CANCELED" :foreground "forest green" :weight bold)
        ("ONHOLD" :foreground "blue" :weight bold)
        ))
;; ("WAITING" :foreground "orange" :weight bold)
;; ("SOMEDAY" :foreground "magenta" :weight bold)
;; ("OPEN" :foreground "blue" :weight bold)
;; ("PROJECT" :foreground "red" :weight bold)))

;; Enforce TODO dependencies
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-log-done nil)
(setq org-log-into-drawer t)

;;
;; TAGS
;;
;; (setq org-tag-alist '((:startgroup . nil)
;;                       ("@work" . ?w)
;;                       ("@home" . ?h)
;;                       (:endgroup . nil)))
;; (setq org-fast-tag-selection-single-key t)


;;
;; Capture
;;
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(define-key global-map "\C-cc" 'org-capture)
;; Refile targets
(setq org-refile-targets '((org-agenda-files :maxlevel . 9)))
;: Use full outline path - we file directly with IDO
(setq  org-refile-use-outline-path t)
;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;;
;; Agenda
;;
;; (setq org-agenda-include-diary t)
(setq org-agenda-files '("~/org"))
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-skip-scheduled-if-done t)
;; (setq org-agenda-time-grid '
;;       ((daily today require-timed)
;;        "----------------"
;;        (800 1200 1800)))

;;
;; MobileOrg
;;
;; Set to the name of the file where new notes will be stored
;;(setq org-mobile-inbox-for-pull (concat org-directory  "flagged.org"))
;; Set to <your Dropbox root directory>/MobileOrg.
;;(setq org-mobile-directory "~/Dropbox/MobileOrg")

;;
;; Org-Present
;;
(add-hook 'org-present-mode-hook
          (lambda ()
            (org-present-big)
            (org-present-read-only)
            (org-display-inline-images)))

(add-hook 'org-present-mode-quit-hook
          (lambda ()
            (org-present-small)
            (org-present-reed-write)
            (org-remove-inline-images)))

;;
;; End
;;
(provide 'personal-org)
;;; personal-org.el ends here
