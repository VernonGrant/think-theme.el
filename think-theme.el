;;; think-theme.el --- think theme

;; Copyright (C) 2022 by Vernon Grant

;; Author: Vernon Grant <vernon@ruppell.io>
;; Version: 1.0.0
;; Keywords: theme, light, red
;; Homepage: https://github.com/VernonGrant/dotfiles

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Think theme for Emacs, used by Vernon Grant.

;;; Code:

(deftheme think
  "think theme")

(let (
      (fg              "#d7d7af")
      (fg-darker       "#d7d787")
      (bg              "#303030")
      (bg-darker       "#262626")
      (bg-lighter      "#444444")
      (cursor          "#cd0000")
      (region          "#3a3a3a")
      (keyword         "#afaf5f")
      (constant        "#d7af5f")
      (comment         "#af875f")
      (string          "#87afaf")
      (warning         "#d75f00")
      )
  (custom-theme-set-faces
   'think

   ;; General
   `(default                              ((t (:background ,bg :foreground ,fg))))
   `(link                                 ((t (:foreground ,keyword :underline t))))
   `(region                               ((t (:background ,region))))
   `(match                                ((t (:background ,region))))
   `(cursor                               ((t (:background ,cursor))))
   `(success                              ((t (:foreground ,keyword))))
   `(font-lock-builtin-face               ((t (:foreground ,fg :bold t))))
   `(font-lock-comment-face               ((t (:foreground ,comment :italic t))))
   `(font-lock-doc-string-face            ((t (:foreground ,comment))))
   `(font-lock-doc-face                   ((t (:foreground ,comment))))
   `(font-lock-constant-face              ((t (:foreground ,constant :bold t))))
   `(font-lock-function-name-face         ((t (:foreground ,fg))))
   `(font-lock-keyword-face               ((t (:foreground ,keyword :bold t))))
   `(font-lock-reference-face             ((t (:foreground ,fg))))
   `(font-lock-string-face                ((t (:foreground ,string))))
   `(font-lock-type-face                  ((t (:foreground ,keyword))))
   `(font-lock-variable-name-face         ((t (:foreground ,fg))))
   `(font-lock-warning-face               ((t (:background ,region :foreground ,warning))))
   `(font-lock-preprocessor-face          ((t (:foreground ,constant))))

   ;; Line numbers
   `(line-number                  ((t (:foreground ,fg  :background ,bg-lighter))))
   `(line-number-current-line     ((t (:foreground ,fg-darker :background ,bg-darker))))

   ;; Help
   `(help-key-binding                    ((t (:foreground ,string))))

   ;; Flyspell
   `(flyspell-incorrect                   ((t (:underline ,t))))
   `(flyspell-duplicate                   ((t (:underline ,t))))

   ;; Mode Line
   `(mode-line                            ((t (:background ,bg-darker))))
   `(mode-line-inactive                   ((t (:background ,bg-lighter))))

   ;; Column Indicator
   `(fill-column-indicator                ((t (:foreground ,bg-lighter))))

   ;; Vertical Borders
   `(vertical-border                      ((t (:foreground ,bg-lighter))))

   ;; Minibuffer
   `(minibuffer-prompt                    ((t (:foreground ,keyword :bold t))))

   ;; Matching Parenthesis
   `(show-paren-match                     ((t (:foreground ,keyword :background ,region :bold t))))
   `(show-paren-match-face                ((t (:foreground ,keyword :background ,region :bold t))))

   ;; I-Search, Highlighting
   `(isearch                              ((t (:foreground ,keyword :background ,region :bold t))))
   `(lazy-highlight                       ((t (:foreground ,fg :background ,region))))
   `(highlight                            ((t (:foreground ,fg :background ,region))))

   ;; Completions, shows available completions
   `(completions-common-part              ((t (:foreground ,keyword :bold t))))
   `(completions-annotations              ((t (:foreground ,comment))))
   `(completions-first-difference         ((t (:bold t))))

   ;; Dired
   `(dired-directory                      ((t (:foreground ,keyword :bold t))))
   `(dired-ignored                        ((t (:foreground ,fg-darker))))

   ;; Company
   `(company-tooltip                      ((t (:foreground ,fg :background ,bg ))))
   `(company-tooltip-selection            ((t (:background ,bg-darker))))
   `(company-tooltip-common               ((t (:foreground ,keyword :bold t ))))
   `(company-tooltip-common-selection     ((t (:foreground ,keyword :background ,bg :bold t ))))
   `(company-scrollbar-bg                 ((t (:background ,bg-darker))))
   `(company-scrollbar-fg                 ((t (:background ,fg))))
   `(company-tooltip-annotation           ((t (:foreground ,comment))))
   `(company-tooltip-annotation-selection ((t (:foreground ,comment))))

   ;; Org
   `(org-headline-done                    ((t (:foreground ,comment))))

   ;; Flycheck
   `(flycheck-info                        ((t (:underline ,t))))
   `(flycheck-warning                     ((t (:underline ,t ))))
   `(flycheck-error                       ((t (:underline ,t))))

   ;; Magit
   )
  )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
(provide-theme 'think)

;;; think-theme.el ends here
