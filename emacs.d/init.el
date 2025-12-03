;; ────────────────────────────────────────────────────────────────────────────────
;; Package Initialization
;; ────────────────────────────────────────────────────────────────────────────────

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


;; ────────────────────────────────────────────────────────────────────────────────
;; Installed Packages
;; ────────────────────────────────────────────────────────────────────────────────

(use-package doom-themes)
(load-theme 'doom-material-dark t)


;; ────────────────────────────────────────────────────────────────────────────────
;; Core Settings
;; ────────────────────────────────────────────────────────────────────────────────

;; UI Specific Settings
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; Relative Line Numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; electric pair
(setq electric-pair-pairs '((?\( . ?\))   ; parentheses
                            (?\[ . ?\])   ; square brackets
                            (?\{ . ?\})   ; curly braces
                            (?\" . ?\")   ; double quotes
                            (?\' . ?\'))) ; single quotes

;; Never let point get closer than 10 lines to top/bottom of window
(setq scroll-margin 10)
(setq scroll-conservatively 101)
(setq scroll-step 1)

;; Handle temporary files
(setq auto-save-default nil)  ;; Disable auto-saving
(setq make-backup-files nil)  ;; Disable backup~ files
(setq create-lockfiles  nil)  ;; Disable .#lock files

;; Some Performance settings via ChatGPT
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold (* 2 1000 1000))))
