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

;; --- Vertico (UI for commands & completion) ---
(use-package vertico
  :init
  (vertico-mode))

;; --- Orderless (fuzzy matching) ---
(use-package orderless
  :custom
  ;; Use orderless everywhere
  (completion-styles '(orderless basic))
  ;; Needed so file paths still complete normally
  (completion-category-overrides
   '((file (styles basic partial-completion)))))

;; --- Marginalia (annotations: file size, mode, etc.) ---
(use-package marginalia
  :init
  (marginalia-mode))


;; ────────────────────────────────────────────────────────────────────────────────
;; Core Settings
;; ────────────────────────────────────────────────────────────────────────────────

;; --- UI Specific Settings ---
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; --- Relative Line Numbers ---
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; --- electric pair ---
(setq electric-pair-pairs '((?\( . ?\))   ; parentheses
                            (?\[ . ?\])   ; square brackets
                            (?\{ . ?\})   ; curly braces
                            (?\" . ?\")   ; double quotes
                            (?\' . ?\'))) ; single quotes

;; --- Only pair () and "" in lisp buffer ---
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq-local electric-pair-pairs '((?\( . ?\))
					      (?\" . ?\")))))
(electric-pair-mode 1)

;; --- Never let point get closer than 10 lines to top/bottom of window ---
(setq scroll-margin 10)
(setq scroll-conservatively 101)
(setq scroll-step 1)

;; --- Handle temporary files ---
(setq auto-save-default nil)  ;; Disable auto-saving
(setq make-backup-files nil)  ;; Disable backup~ files
(setq create-lockfiles  nil)  ;; Disable .#lock files

;; --- Some Performance settings via ChatGPT ---
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold (* 2 1000 1000))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-themes marginalia orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
