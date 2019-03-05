;;; metamath-mode-el -- Major mode for editing metamath files

(defvar metamath-mode-hook nil)
(defvar metamath-mode-map
  (let ((metamath-mode-map (make-keymap)))
    (define-key metamath-mode-map "\C-j" 'newline-and-indent)
    metamath-mode-map)
  "Keymap for metamath major mode")

(add-to-list 'auto-mode-alist '("\\.mm\\'" . metamath-mode))

(defconst metamath-font-lock-keywords
  '(("\\(\\$[.={}ac-fpv]\\)" . font-lock-builtin-face)
    ("^\\([^$][A-Za-z0-9]+\\)" . font-lock-function-name-face)))

(defvar metamath-mode-syntax-table
  (let ((metamath-mode-syntax-table (make-syntax-table)))
    (modify-syntax-entry ?$ ". 13" metamath-mode-syntax-table)
    (modify-syntax-entry ?\( ". 2" metamath-mode-syntax-table)
    (modify-syntax-entry ?\) ". 4" metamath-mode-syntax-table)
    metamath-mode-syntax-table)
  "Syntax table for metamath-mode")

(defun metamath-mode ()
  (interactive)
  (kill-all-local-variables)
  (use-local-map metamath-mode-map)
  (set-syntax-table metamath-mode-syntax-table)
  ;; Set up font-lock
  (set (make-local-variable 'font-lock-defaults) '(metamath-font-lock-keywords))
  (setq major-mode 'metamath-mode)
  (setq mode-name "metamath")
  (run-hooks 'metamath-mode-hook))

(provide 'metamath-mode)
