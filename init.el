;;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; Formatting and indentation
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-tab-always-indent t)
(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'whitespace-cleanup)

;; Compilation keys
(global-set-key [f10] 'compile)
(global-set-key [f9] 'next-error)
(setq compilation-scroll-output t)


(global-set-key [kp-delete] 'delete-char)
(if (eq system-type 'darwin)
    (setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
