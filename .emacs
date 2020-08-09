(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)

;;(load-theme 'minimal-black t)
(load-theme 'brin t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-scroll-bar -1)
(ido-mode 1)
(fringe-mode '(0 . 0))
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-,") (kbd "C-u C-u C-c C-,"))
(global-set-key (kbd "C-x g") 'magit-status)

(set-default-font "Fira Code 14")

(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "x"))
  :hook prog-mode)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  (global-set-key (kbd "C-c C-d") 'dante-type-at)
  )

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq python-indent-offset 2)
(setq haskell-stylish-on-save t)
(setq haskell-mode-stylish-haskell-path "brittany")
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil))
(defun display-startup-echo-area-message () (message ""))

(global-display-line-numbers-mode)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x <C-up>") (lambda() (interactive)(find-file user-init-file)))
(global-set-key (kbd "C-c r") (lambda() (interactive)(load-file user-init-file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "9ee311a2a1f23cf88c2253a17b829d3bf0237f5886d5a7bec1a9a43b3d341ecd" "6a0edb6b0f4c6d0566325cf91a1a34daa179e1979136ce0a528bf83aff9b7719" "e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default)))
 '(dante-methods-alist
   (quote
    ((styx "styx.yaml"
	   ("styx" "repl" dante-target))
     (new-impure-nix dante-cabal-new-nix
		     ("nix-shell" "--run"
		      (concat "cabal v2-repl "
			      (or dante-target
				  (dante-package-name)
				  "")
			      " --builddir=dist/dante")))
     (new-nix dante-cabal-new-nix
	      ("nix-shell" "--run"
	       (concat "cabal v2-repl "
		       (or dante-target
			   (dante-package-name)
			   "")
		       " --builddir=dist/dante")))
     (nix dante-cabal-nix
	  ("nix-shell" "--run"
	   (concat "cabal v2-repl "
		   (or dante-target "")
		   " --builddir=dist/dante")))
     (impure-nix dante-cabal-nix
		 ("nix-shell" "--run"
		  (concat "cabal v2-repl "
			  (or dante-target "")
			  " --builddir=dist/dante")))
     (new-build "cabal.project.local"
		("cabal" "new-repl"
		 (or dante-target
		     (dante-package-name)
		     nil)
		 "--builddir=dist/dante"))
     (nix-ghci
      #[257 "\300\301\302#\207"
	    [directory-files t "shell.nix\\|default.nix"]
	    5 "

(fn D)"]
      ("nix-shell" "--run" "ghci"))
     (stack "stack.yaml"
	    ("stack" "repl" dante-target))
     (mafia "mafia"
	    ("mafia" "repl" dante-target))
     (bare-cabal
      #[257 "\300\301\302#\207"
	    [directory-files t "..cabal$"]
	    5 "

(fn D)"]
      ("cabal" "v2-repl" dante-target "--builddir=dist/dante"))
     (bare-ghci
      #[257 "\300\207"
	    [t]
	    2 "

(fn _)"]
      ("ghci")))))
 '(fira-code-mode-disabled-ligatures (quote ("[]" "x")))
 '(package-selected-packages
   (quote
    (markdown-mode sublime-themes ewal base16-theme xresources-theme magit dante use-package fira-code-mode pretty-mode quasi-monochrome-theme haskell-mode haskell-emacs gruber-darker-theme ## smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-catchall-clause-face ((t (:background "gray14"))))
 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "#aaffcc"))))
 '(agda2-highlight-datatype-face ((t (:foreground "snow"))))
 '(agda2-highlight-field-face ((t (:foreground "white smoke"))))
 '(agda2-highlight-function-face ((t (:foreground "white smoke" :weight extra-bold))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "light gray"))))
 '(agda2-highlight-keyword-face ((t (:weight extra-bold))))
 '(agda2-highlight-missing-definition-face ((t (:background "gray14"))))
 '(agda2-highlight-module-face ((t (:foreground "gray"))))
 '(agda2-highlight-number-face ((t (:foreground "gainsboro"))))
 '(agda2-highlight-postulate-face ((t (:foreground "gray"))))
 '(agda2-highlight-primitive-face ((t (:foreground "dark gray"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "light gray"))))
 '(agda2-highlight-record-face ((t (:foreground "snow"))))
 '(agda2-highlight-string-face ((t (:foreground "#aaffff"))))
 '(agda2-highlight-unsolved-meta-face ((t (:background "gray14"))))
 '(font-lock-comment-face ((t (:foreground "#75715E"))))
 '(font-lock-string-face ((t (:foreground "#73c936" :family "Black"))))
 '(highlight ((t (:background "gray14")))))
