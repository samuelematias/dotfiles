;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.ect\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.xtend\\'" . java-mode))
(add-hook 'html-mode-hook #'turn-off-auto-fill)
(add-hook 'markdown-mode-hook #'turn-off-auto-fill)
(add-hook 'dart-mode-hook (lambda () (setq left-fringe-width 16)))
(add-hook 'java-mode-hook (lambda () (setq left-fringe-width 16)))

(defun reverse-transpose-sexps (arg)
    (interactive "*p")
    (transpose-sexps (- arg))
    (backward-sexp (1+ arg))
    (forward-sexp 1))

(defun rg-ignoring-folders (folders)
  "ripgrep selected word in project excluding folder"
  (let ((symbol (thing-at-point 'symbol t))
        (args (mapconcat 'identity
                         (mapcar #'(lambda(folder) (concat "-g '!" folder "/*'"))
                                 folders)
                         " ")))
    (counsel-rg symbol (counsel--git-root) args)))

(setq-default evil-kill-on-visual-paste nil)

(setq
 history-length 300
 indent-tabs-mode nil
 confirm-kill-emacs nil
 mode-line-default-help-echo nil
 show-help-function nil
 evil-multiedit-smart-match-boundaries nil
 compilation-scroll-output 'first-error

 read-process-output-max (* 1024 1024)

 projectile-project-search-path '("~/workspace/" "~/workspace/job/" "~/workspace/personal/" "~/workspace/personal/flutter/" "~/workspace/job/ifood/")
 projectile-enable-caching nil

 evil-split-window-below t
 evil-vsplit-window-right t

 counsel-rg-base-command "rg -i -M 1000 --no-heading --line-number --color never %s ."

 frame-title-format (setq icon-title-format  ;; set window title with "project"
                          '((:eval (projectile-project-name))))

 doom-font (font-spec :family "FiraCode Nerd Font" :size 16)
 doom-unicode-font (font-spec :family "Material Design Icons")
 doom-big-font-increment 2

 doom-theme 'doom-dracula
 doom-themes-treemacs-theme "all-the-icons"
 doom-localleader-key ","

 +format-on-save-enabled-modes '(dart-mode)
 +lsp-auto-install-servers t

 dap-enable-mouse-support nil

 evil-collection-setup-minibuffer t)


(set-popup-rule! "\\*LSP Dart tests\\*" :height 0.3)
(set-popup-rule! "\\*Hover\\*" :quit nil)
(set-popup-rule! "\\*dap-ui-locals\\*" :side 'right :width 0.3)
(set-popup-rule! "\\*dap-ui-sessions\\*" :side 'right :width 0.3)
(set-popup-rule! "\\*midje-test-report\\*" :side 'right :width 0.5)

(use-package! cider
  :after clojure-mode
  :config
  (setq cider-ns-refresh-show-log-buffer t
        cider-show-error-buffer t;'only-in-repl
        cider-font-lock-dynamically '(macro core function var deprecated)
        cider-prompt-for-symbol nil)
  (set-popup-rule! "*cider-test-report*" :side 'right :width 0.5)
  (set-popup-rule! "^\\*cider-repl" :side 'bottom :quit nil)
  (set-lookup-handlers! 'cider-mode nil))

(use-package! clj-refactor
  :after clojure-mode
  :config
  (set-lookup-handlers! 'clj-refactor-mode nil)
  (setq cljr-warn-on-eval nil
        cljr-eagerly-build-asts-on-startup nil
        cljr-add-ns-to-blank-clj-files nil
        cljr-magic-require-namespaces
        '(("s"   . "schema.core")
          ("th"  . "common-core.test-helpers")
          ("gen" . "common-test.generators")
          ("d-pro" . "common-datomic.protocols.datomic")
          ("ex" . "common-core.exceptions")
          ("dth" . "common-datomic.test-helpers")
          ("t-money" . "common-core.types.money")
          ("t-time" . "common-core.types.time")
          ("d" . "datomic.api")
          ("m" . "matcher-combinators.matchers")
          ("pp" . "clojure.pprint"))))

(use-package! clojure-mode
  :config
  (setq clojure-indent-style 'align-arguments
        clojure-thread-all-but-last t
        clojure-align-forms-automatically t
        yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-c"))

(use-package! company
  :config
  (setq company-tooltip-align-annotations t))

(use-package! hover
  :after dart-mode
  :config
  (setq hover-hot-reload-on-save t
        hover-clear-buffer-on-hot-restart t
        hover-screenshot-path "$HOME/Pictures"))

(use-package! doom-modeline
  :init
  (setq doom-modeline-major-mode-icon t
        doom-modeline-buffer-encoding nil
        doom-modeline-buffer-file-name-style 'relative-to-project
        doom-modeline-vcs-max-length 0
        vc-display-status nil))

(use-package! lsp-dart
  :config
  (when-let (dart-exec (executable-find "dart"))
    (let ((dart-sdk-path (-> dart-exec
                             file-chase-links
                             file-name-directory
                             directory-file-name
                             file-name-directory)))
      (setq lsp-dart-sdk-dir dart-sdk-path
            lsp-dart-dap-flutter-hot-reload-on-save t))))

;;(use-package! lsp-dart
;;  :config
;;  (when-let (dart-exec (executable-find "dart"))
;;    (let ((dart-sdk-path (-> dart-exec
;;                            file-chase-links
;;                             file-name-directory
;;                             directory-file-name
;;                             file-name-directory)))
;;      (setq lsp-dart-sdk-dir dart-sdk-path
;;            lsp-dart-dap-flutter-hot-reload-on-save t)))
;;      (dap-register-debug-template "Flutter :: Flavor Dev"
;;                               (list :flutterPlatform "x86_64"
;;                                     :type "dart"
;;                                     :program "lib/main_dev.dart"
;;                                     :args '("--flavor dev" "-d all"))))


;;(use-package! lsp-dart
;;  :config
;;  (when-let (dart-exec (executable-find "dart"))
;;    (let ((dart-sdk-path (-> dart-exec
;;                             file-chase-links
;;                             file-name-directory
;;                             directory-file-name
;;                             file-name-directory)))
;;     (setq lsp-dart-sdk-dir "/usr/local/Caskroom/flutter/1.22.5/flutter/bin/cache/dart-sdk"
;;            lsp-dart-dap-flutter-hot-reload-on-save t))))

;;(use-package lsp-dart
;;  :ensure t
;;  :hook (dart-mode . lsp))
            
;;(setq lsp-dart-sdk-dir "/usr/local/Caskroom/flutter/1.22.5/flutter/bin/cache/dart-sdk")
;;(setq lsp-flutter-sdk-dir "/usr/local/Caskroom/flutter/1.22.5/flutter")
;;(setq dart-server-sdk-path "/usr/local/Caskroom/flutter/1.22.5/flutter/bin/cache/dart-sdk")
;;(setq dart-server-executable-path "/usr/local/Caskroom/flutter/1.22.5/flutter/bin/cache/dart-sdk")
;;(setq dart-server-enable-analysis-server t)
;;(add-hook 'dart-server-hook 'flycheck-mode)

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

(use-package! lsp-java
  :after lsp
  :init
  (setq lsp-java-format-settings-url "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
        lsp-java-format-settings-profile "GoogleStyle"
        lsp-java-save-actions-organize-imports t
        lsp-java-references-code-lens-enabled t
        lsp-java-implementations-code-lens-enabled t
        lsp-file-watch-ignored-directories
        '(".idea" ".ensime_cache" ".eunit" "node_modules"
          ".git" ".hg" ".fslckout" "_FOSSIL_"
          ".bzr" "_darcs" ".tox" ".svn" ".stack-work"
          "build")))

(use-package! lsp-mode
  :commands lsp
  :hook ((clojure-mode . lsp)
         (dart-mode . lsp)
         (java-mode . lsp))
  :config
    (setq lsp-clojure-custom-server-command t
          lsp-headerline-breadcrumb-enable t
          lsp-lens-enable t
          lsp-enable-file-watchers t
          lsp-signature-auto-activate nil
          lsp-semantic-tokens-enable t
          lsp-completion-use-last-result nil))
  (advice-add #'lsp-rename :after (lambda (&rest _) (projectile-save-project-buffers)))

(use-package! lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-peek-list-width 60
        lsp-ui-peek-fontify 'always
        lsp-ui-sideline-show-code-actions nil))

(use-package! org-tree-slide
  :config
  (setq +org-present-text-scale 2
        org-tree-slide-modeline-display 'outside
        org-tree-slide-fold-subtrees-skipped nil)
  (add-hook! 'org-tree-slide-play-hook #'org-display-inline-images)
  (add-hook! 'org-tree-slide-play-hook #'doom-disable-line-numbers-h))

(use-package! paredit
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)))

(use-package! dap-mode
  :init
  (require 'dap-chrome))

(use-package! treemacs-all-the-icons
  :after treemacs)

(after! projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

(put 'narrow-to-region 'disabled nil)