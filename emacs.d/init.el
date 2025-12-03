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

;; Never let point get closer than 10 lines to top/bottom of window
(setq scroll-margin 10)
(setq scroll-conservatively 101)
(setq scroll-step 1)
