;;; init.el -*- lexical-binding: t -*-
;;

;; If we have a local source tree for the CEDET package, install
;; it. This must be done in `init.el' because it has to replace
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
