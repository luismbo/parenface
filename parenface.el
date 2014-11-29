;;; parenface.el --- a face for parens in lisp modes. -*- lexical-binding: t -*-

;; Author: Jonas Bernoulli <jonas@bernoul.li>
;; Version: 2.0
;; Maintainer: Luís Oliveira <loliveira@common-lisp.net>

;; This file is not part of GNU Emacs.
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your
;; option) any later version.
;;
;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; The intended purpose of this package is to make parentheses less
;; visible in Lisp code by dimming them.
;;
;; Enable it in your `.emacs' file:
;;
;;     (global-parenface-mode)

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
(global-parenface-mode)

(provide 'parenface)

;;; parenface.el ends here
