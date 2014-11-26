;;; parenface.el --- Provide a face for parens in lispy modes. -*- lexical-binding: t -*-

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.3
;; Maintainer: Grant Rettke

;;; Commentary:

;; Add a paren-face to emacs and add support for it to the various lisp modes.
;;
;; Based on some code that Boris Schaefer <boris@uncommon-sense.net> posted
;; to comp.lang.scheme in message <87hf8g9nw5.fsf@qiwi.uncommon-sense.net>.
;;
;; Log:
;; Modifications by Grant Rettke <grettke@acm.org>, November 2012 only to add support for editor and REPL modes for:
;; Clojure (and nREPL), IELM, Jess and inferior-jess.
;; 2014-01-01 add support for [] {} by Zhao Wei <kaihaosw@gmail.com>
;;
;; Usage:
;; (eval-after-load 'parenface
;;   (progn
;;     (set-face-foreground 'parenface-paren-face "SteelBlue4")
;;     (set-face-foreground 'parenface-bracket-face "SteelBlue4")
;;     (set-face-foreground 'parenface-curly-face "SteelBlue4")))

;;; Code:

(defgroup parenface nil
  "Faces for parentheses, brackets and curly braces.
These faces are only enabled if `parenface-mode' is turned on.
See `global-parenface-mode' for an easy way to do so."
  :group 'font-lock-extra-types
  :group 'faces)

(defface parenface-paren-face
    '((((class color)) (:foreground "DimGray")))
  "Face for displaying parentheses: ()."
  :group 'parenface)

(defface parenface-bracket-face
    '((((class color)) (:foreground "DimGray")))
  "Face for displaying a bracket: []."
  :group 'parenface)

(defface parenface-curly-face
    '((((class color)) (:foreground "DimGray")))
  "Face for displaying a curly braces: {}."
  :group 'parenface)

(defcustom parenface-modes
  '(arc-mode inferior-arc-mode
    clojure-mode cider-repl-mode nrepl-mode
    emacs-lisp-mode lisp-interaction-mode ielm-mode
    jess-mode inferior-jess-mode
    lisp-mode
    ;; slime-repl-mode ; XXX: interferes with `slime-repl-prompt-face'.
    scheme-mode inferior-scheme-mode)
  "Major modes in which `parenface-mode' should be turned on.
When `global-parenface-mode' is turned on, the buffer-local mode
is turned on in all buffers whose major mode is or derives from
one of the modes listed here."
  :group 'parenface)

(defcustom parenface-paren-regexp "[()]"
  "Regular expression to match parentheses."
  :group 'parenface)

(defcustom parenface-bracket-regexp "[\\[\\]]"
  "Regular expression to match brackets."
  :group 'parenface)

(defcustom parenface-curly-regexp "[{}]"
  "Regular expression to match curly braces."
  :group 'parenface)

(defvar parenface-mode-lighter "")

;;;###autoload
(define-minor-mode parenface-mode
  "Enable dedicated faces just for parentheses, brackets and
curly braces."
  :lighter parenface-mode-lighter
  (dolist (args `((nil ((,parenface-paren-regexp   0 'parenface-paren-face)))
                  (nil ((,parenface-bracket-regexp 0 'parenface-bracket-face)))
                  (nil ((,parenface-curly-regexp   0 'parenface-curly-face)))))
    (apply (if parenface-mode
               #'font-lock-add-keywords
               #'font-lock-remove-keywords)
           args))
  (when (called-interactively-p 'any)
    (font-lock-fontify-buffer)))

;;;###autoload
(define-globalized-minor-mode global-parenface-mode
  parenface-mode turn-on-parenface-mode-if-desired
  :group 'parenface)

(defun turn-on-parenface-mode-if-desired ()
  (when (apply 'derived-mode-p parenface-modes)
    (parenface-mode 1)))

;; for backwards-compatibility with how parenface.el was usually set
;; up by simply loading or requiring it.
(global-parenface-mode 1)

(provide 'parenface)

;;; parenface.el ends here
