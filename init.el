;;; init.el -*- lexical-binding: t -*-
;;

(require 'package)
(setq package-archives
      '(("gnu"         . "https://elpa.gnu.org/packages/")
        ("org"         . "http://orgmode.org/elpa/")
        ("melpa"       . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmalade"   . "https://marmalade-repo.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")
	))
(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("marmalade" . 20)
        ("org" . 20)
        ("elpy" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))
(setq package-menu-hide-low-priority t)
(setq load-prefer-newer t)
(setq custom-file (concat user-emacs-directory "custom.el"))

(setq package-selected-packages '(use-package))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(package-refresh-contents t)

;; add an extra directory to load path, so .emacs.d doesn't get even
;; more crowded.
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "src")))

(add-hook 'package--post-download-archives-hook 'package-install-selected-packages)

(add-hook 'package--post-download-archives-hook
          ;; create an unnamed function that uses Org mode to load
          ;; source code from a file containing text and source code.
	  `(lambda ()
	     (require 'org)
	     (org-babel-load-file
	      (expand-file-name "configure-emacs.org" user-emacs-directory)
	      t))
	  t)
