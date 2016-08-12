;;; init.el -*- lexical-binding: t -*-
;;

(eval-when-compile (require 'package))
(setq package-archives
      '(("gnu"         . "https://elpa.gnu.org/packages/")
        ("org"         . "http://orgmode.org/elpa/")
        ("melpa"       . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmalade"   . "https://marmalade-repo.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("marmalade" . 20)
        ("org" . 20)
        ("elpy" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; If we have a local source tree for the CEDET package, install
;; it. This must be done here in `init.el' because it has to replace
;; the version integrated into Emacs.
;; Activate this by setting the CEDET_HOME environment variable.
;; If you always use the integrated version you can remove this
;; section.
;; See cedet/common/cedet.info for configuration details.
(let ((cedet-home (getenv "CEDET_HOME")))
  (when (not (null cedet-home))
    ;; IMPORTANT: You must place this *before* any CEDET component (including
    ;; EIEIO) gets activated by another package (Gnus, auth-source, ...).
    (load-file (expand-file-name "cedet-devel-load.el" cedet-home))
    (condition-case some-error
        (load-file (expand-file-name "cedet-contrib-load.el" (expand-file-name "contrib" cedet-home)))
      ((debug error) (message "[init] ERROR Probably need to re-compile contrib\ directory: %s" (cdr some-error))))))

;; similar considerations apply to a local version of the Org mode
;; source code.
;; load Org-mode from source when the ORG_HOME environment variable is set
(when (getenv "ORG_HOME")
  (let ((org-lisp-dir (expand-file-name "lisp" (getenv "ORG_HOME"))))
    (when (file-directory-p org-lisp-dir)
      (add-to-list 'load-path org-lisp-dir)
      (require 'org))))

;; all further initialization gets done *after* Emacs has completed
;; loading, so we'll put it in the `after-init-hook' hook variable.
(add-hook 'after-init-hook
          ;; create an unnamed function that uses Org mode to load
          ;; source code from a file containing text and source code.
 `(lambda ()
    (org-babel-load-file (expand-file-name "configure-emacs.org" user-emacs-directory))))

