;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(add-to-list 'load-path "~/.emacs.d/plugins/")
;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(setq-default c-default-style "k&r"
    c-basic-offset 4
    tab-width 4
    indent-tabs-mode t)

(setq inhibit-startup-message t)
(autoload 'js2-mode "js2-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(setq-default sgml-basic-offset 4)
;(require 'dot-mode)
(autoload 'dot-mode "dot-mode.el" nil t)
;(add-hook 'find-file-hooks 'dot-mode-on)
