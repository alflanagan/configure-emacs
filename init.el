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

;; the original idea of using priorities was to favor melpa-stable
;; over melpa for a couple of packages.
;; didn't realize how many packages were updating melpa regularly, but
;; had not updated melpa-stable in a long time.

;; (setq package-archive-priorities
;;       '(("melpa-stable" . 20)
;;         ("marmalade" . 20)
;;         ("org" . 20)
;;         ("elpy" . 20)
;;         ("gnu" . 10)
;;         ("melpa" . 0)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; add an extra directory to load path, so .emacs.d doesn't get even
;; more crowded.
(add-to-list 'load-path (expand-file-name "src" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "use-package" user-emacs-directory))

;; (setq package-selected-packages '(use-package))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(package-refresh-contents t)

(defun load-everything ()
  "Loads and executes =configure-emacs.org= file."
  (require 'use-package)
  (require 'org)

  (org-babel-load-file
   (expand-file-name "configure-emacs.org" user-emacs-directory)))

(add-hook 'after-init-hook 'load-everything)
