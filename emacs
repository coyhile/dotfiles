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
(setq-default js2-basic-offset 4)

;(require 'dot-mode)
(autoload 'dot-mode "dot-mode.el" nil t)
;(add-hook 'find-file-hooks 'dot-mode-on)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
;;;(autoload 'gfm-mode "gfm-mode"
;;;   "Major mode for editing GitHub Flavored Markdown files" t)
(autoload 'gfm-mode "markdown-mode.el"
   "Major mode for editing GitHub Flavored Markdown files" t)
(autoload 'd-mode "d-mode.el" "Major Mode for Editing DTrace" t) 
(autoload 'yaml-mode "yaml-mode.el" "Major Mode for Editing YAML" t) 
(autoload 'multi-web-mode "multi-web-mode.el" "Minor Mode for Web Gunk" t)

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.d$" . d-mode))
;;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
