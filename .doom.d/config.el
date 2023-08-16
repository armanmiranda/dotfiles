;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Arman Miranda"
      user-mail-address "arman.miranda@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; org-roam configuration
(setq org-roam-directory (file-truename "Documents/personal/org-roam"))
;; (org-roam-db-autosync-mode)

;; Set org-agenda to fullscreen
(advice-add 'org-agenda :after 'delete-other-windows)
(org-roam-db-autosync-mode)

;; Automatically wrap when beyond 80 characters
(setq-default fill-column 80)
(setq org-startup-truncated 'nil)
(add-hook 'org-mode-hook '(lambda ()
                            (toggle-word-wrap)
                            (turn-on-auto-fill)
                            (org-indent-mode)))

(add-hook 'org-roam-mode-hook '(lambda ()
                            (toggle-word-wrap)
                            (turn-on-auto-fill)
                            (org-indent-mode)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Rebind ex-command :x to kill-buffer and not the window
(evil-ex-define-cmd "x" 'kill-this-buffer)

;; Indentation configurations
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Auto insert newline
(setq-default require-final-newline t mode-require-final-newline t)

;; Rebind neotree open, horizontal, and verical paths
(evil-define-key 'evilified neotree-mode-map (kbd "o") 'neotree-enter)
(evil-define-key 'evilified neotree-mode-map (kbd "i") 'neotree-enter-horizontal-split)
(evil-define-key 'evilified neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)

;; Rebind buffer switch to gt
(define-key evil-normal-state-map (kbd "gt") 'next-buffer)
(define-key evil-normal-state-map (kbd "gT") 'previous-buffer)

;; Ledger Configuration
(setq ledger-post-amount-alignment-column 80)

;; Magit gitflow configuration
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
(evil-define-key '(normal visual) magit-mode-map (kbd "%") 'magit-gitflow-popup)
