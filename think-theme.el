;;; think-theme.el --- Warm sepia-toned dark theme for reduced eye strain

;; Copyright (C) 2022 by Vernon Grant

;; Author: Vernon Grant <vernon@ruppell.io>
;; Version: 1.1.0
;; Keywords: theme, warm, sepia, dark
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
;; Think — a warm, sepia-toned dark theme designed for long sessions
;; in mixed lighting.  The background is deliberately lighter than
;; typical dark themes so it doesn't shout in daylight, and the syntax
;; palette is constrained to a narrow warm arc with a low chroma
;; budget.  High-chroma signals (cursor, search matches, errors) are
;; the ONLY loud colors on screen, so the eye is drawn to them.

;;; Code:

(deftheme think
  "Warm sepia-toned dark theme.")

(let (;; Neutrals — 4-step ramp plus a warm-tinted hl-line
      (bg                 "#303030")   ; editor background
      (bg-darker          "#262626")   ; deepest surface
      (bg-lighter         "#444444")   ; elevated (mode-line, tabs, headings)
      (bg-hl              "#353030")   ; hl-line — whisper warm, stays distinct from region
      (region             "#3a3a3a")   ; selection background

      ;; Foregrounds
      (fg                 "#d7d7af")   ; body text — cream
      (fg-vivid           "#d7d787")   ; emphasis, headings — mustard
      (fg-dim             "#8a8778")   ; metadata, inactive, ignored

      ;; Warm syntax cascade — low chroma, calm
      (comment            "#8a7255")   ; dimmed brown, recedes
      (keyword            "#afaf5f")   ; olive
      (type               "#c4a45f")   ; tan-gold
      (constant           "#d7af5f")   ; gold
      (string             "#8fbc8f")   ; sea green

      ;; Signals — high chroma, used sparingly to grab focus
      (cursor             "#ff4500")   ; vermillion (iconic)
      (attention          "#ff8700")   ; bright amber
      (warning            "#d78700")   ; amber
      (err                "#d75f5f")   ; brick red
      (match              "#ffd75f")   ; electric yellow — isearch, matches
      (added              "#afd75f")   ; lime — additions, success

      ;; Cool accent — one, restrained
      (meta               "#87afaf")   ; dusty teal — branches, links, refs

      ;; Derived diff backgrounds
      (diff-added-bg      "#2d3826")
      (diff-added-bg-hl   "#3a4830")
      (diff-removed-bg    "#3a2828")
      (diff-removed-bg-hl "#4a3030"))
  (custom-theme-set-faces
   'think

   ;; -----------------------------------------------------------------
   ;; Core faces
   ;; -----------------------------------------------------------------
   `(default                                 ((t (:background ,bg :foreground ,fg))))
   `(cursor                                  ((t (:background ,cursor))))
   `(region                                  ((t (:background ,region :extend t))))
   `(secondary-selection                     ((t (:background ,bg-lighter))))
   `(highlight                               ((t (:background ,region :foreground ,fg))))
   `(hl-line                                 ((t (:background ,bg-hl :extend t))))
   `(fringe                                  ((t (:background ,bg :foreground ,fg-dim))))
   `(vertical-border                         ((t (:foreground ,bg-lighter))))
   `(window-divider                          ((t (:foreground ,bg-lighter))))
   `(window-divider-first-pixel              ((t (:foreground ,bg-lighter))))
   `(window-divider-last-pixel               ((t (:foreground ,bg-lighter))))
   `(fill-column-indicator                   ((t (:foreground ,bg-lighter))))
   `(link                                    ((t (:foreground ,meta :underline t))))
   `(link-visited                            ((t (:foreground ,comment :underline t))))
   `(button                                  ((t (:foreground ,meta :underline t))))
   `(success                                 ((t (:foreground ,added :weight bold))))
   `(warning                                 ((t (:foreground ,warning :weight bold))))
   `(error                                   ((t (:foreground ,err :weight bold))))
   `(shadow                                  ((t (:foreground ,fg-dim))))
   `(match                                   ((t (:background ,match :foreground ,bg-darker :weight bold))))
   `(escape-glyph                            ((t (:foreground ,meta))))
   `(homoglyph                               ((t (:foreground ,meta))))
   `(minibuffer-prompt                       ((t (:foreground ,constant :weight bold))))
   `(tooltip                                 ((t (:background ,bg-darker :foreground ,fg))))
   `(trailing-whitespace                     ((t (:background ,err))))
   `(header-line                             ((t (:background ,bg :foreground ,fg-dim :box nil))))
   `(tab-line                                ((t (:background ,bg :foreground ,fg-dim :box nil))))

   ;; -----------------------------------------------------------------
   ;; Font-lock
   ;; -----------------------------------------------------------------
   `(font-lock-builtin-face                  ((t (:foreground ,fg :weight bold))))
   `(font-lock-comment-face                  ((t (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face        ((t (:foreground ,comment))))
   `(font-lock-doc-face                      ((t (:foreground ,comment :slant italic))))
   `(font-lock-doc-string-face               ((t (:foreground ,comment))))
   `(font-lock-constant-face                 ((t (:foreground ,constant :weight bold))))
   `(font-lock-function-name-face            ((t (:foreground ,fg-vivid))))
   `(font-lock-keyword-face                  ((t (:foreground ,keyword :weight bold))))
   `(font-lock-reference-face                ((t (:foreground ,fg))))
   `(font-lock-string-face                   ((t (:foreground ,string))))
   `(font-lock-type-face                     ((t (:foreground ,type))))
   `(font-lock-variable-name-face            ((t (:foreground ,fg))))
   `(font-lock-warning-face                  ((t (:foreground ,warning :weight bold))))
   `(font-lock-preprocessor-face             ((t (:foreground ,constant))))
   `(font-lock-negation-char-face            ((t (:foreground ,attention :weight bold))))
   `(font-lock-regexp-grouping-backslash     ((t (:foreground ,attention))))
   `(font-lock-regexp-grouping-construct     ((t (:foreground ,attention :weight bold))))
   `(font-lock-number-face                   ((t (:foreground ,constant))))
   `(font-lock-operator-face                 ((t (:foreground ,fg))))
   `(font-lock-property-name-face            ((t (:foreground ,keyword))))
   `(font-lock-property-use-face             ((t (:foreground ,keyword))))
   `(font-lock-punctuation-face              ((t (:foreground ,fg-dim))))
   `(font-lock-bracket-face                  ((t (:foreground ,fg-dim))))
   `(font-lock-delimiter-face                ((t (:foreground ,fg-dim))))
   `(font-lock-escape-face                   ((t (:foreground ,attention))))

   ;; -----------------------------------------------------------------
   ;; Line numbers
   ;; -----------------------------------------------------------------
   `(line-number                             ((t (:foreground ,fg-dim :background ,bg))))
   `(line-number-current-line                ((t (:foreground ,constant :background ,bg :weight bold))))
   `(line-number-major-tick                  ((t (:foreground ,fg :background ,bg))))
   `(line-number-minor-tick                  ((t (:foreground ,fg-dim :background ,bg))))

   ;; -----------------------------------------------------------------
   ;; Search & highlighting — designed to POP
   ;; -----------------------------------------------------------------
   `(isearch                                 ((t (:background ,match :foreground ,bg-darker :weight bold))))
   `(isearch-fail                            ((t (:background ,err :foreground ,bg-darker :weight bold))))
   `(lazy-highlight                          ((t (:background ,constant :foreground ,bg-darker :weight bold))))
   `(isearch-group-1                         ((t (:background ,attention :foreground ,bg-darker :weight bold))))
   `(isearch-group-2                         ((t (:background ,added :foreground ,bg-darker :weight bold))))
   `(query-replace                           ((t (:background ,match :foreground ,bg-darker :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Show paren
   ;; -----------------------------------------------------------------
   `(show-paren-match                        ((t (:foreground ,match :background ,region :weight bold))))
   `(show-paren-match-face                   ((t (:foreground ,match :background ,region :weight bold))))
   `(show-paren-mismatch                     ((t (:foreground ,err :background ,region :weight bold))))
   `(show-paren-match-expression             ((t (:background ,region))))

   ;; -----------------------------------------------------------------
   ;; Mode line
   ;; -----------------------------------------------------------------
   `(mode-line                               ((t (:background ,bg-darker :foreground ,fg :box nil))))
   `(mode-line-inactive                      ((t (:background ,bg-lighter :foreground ,fg-dim :box nil))))
   `(mode-line-emphasis                      ((t (:foreground ,constant :weight bold))))
   `(mode-line-highlight                     ((t (:background ,region))))
   `(mode-line-buffer-id                     ((t (:foreground ,fg-vivid :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Centaur tabs
   ;; -----------------------------------------------------------------
   `(centaur-tabs-default                    ((t (:background ,bg :foreground ,fg-dim :box (:line-width 4 :color ,bg)))))
   `(centaur-tabs-unselected                 ((t (:background ,bg-darker :foreground ,fg-dim :box (:line-width 4 :color ,bg-darker)))))
   `(centaur-tabs-selected                   ((t (:background ,bg-lighter :foreground ,constant :weight bold :box (:line-width 4 :color ,bg-lighter)))))
   `(centaur-tabs-unselected-modified        ((t (:background ,bg-darker :foreground ,attention :box (:line-width 4 :color ,bg-darker)))))
   `(centaur-tabs-selected-modified          ((t (:background ,bg-lighter :foreground ,attention :weight bold :box (:line-width 4 :color ,bg-lighter)))))
   `(centaur-tabs-active-bar-face            ((t (:background ,constant))))
   `(centaur-tabs-modified-marker-selected   ((t (:foreground ,attention))))
   `(centaur-tabs-modified-marker-unselected ((t (:foreground ,attention))))

   ;; -----------------------------------------------------------------
   ;; Minibuffer completion
   ;; -----------------------------------------------------------------
   `(completions-common-part                 ((t (:foreground ,match :weight bold))))
   `(completions-first-difference            ((t (:foreground ,fg-vivid :weight bold))))
   `(completions-annotations                 ((t (:foreground ,fg-dim :slant italic))))

   ;; Orderless — each fragment gets its own hue so overlapping matches read clearly
   `(orderless-match-face-0                  ((t (:foreground ,match :weight bold))))
   `(orderless-match-face-1                  ((t (:foreground ,added :weight bold))))
   `(orderless-match-face-2                  ((t (:foreground ,meta :weight bold))))
   `(orderless-match-face-3                  ((t (:foreground ,attention :weight bold))))

   ;; Vertico
   `(vertico-current                         ((t (:background ,bg-lighter :extend t))))
   `(vertico-multiline                       ((t (:foreground ,fg-dim))))
   `(vertico-group-title                     ((t (:foreground ,meta :weight bold))))
   `(vertico-group-separator                 ((t (:foreground ,bg-lighter :strike-through ,bg-lighter))))

   ;; Marginalia
   `(marginalia-key                          ((t (:foreground ,constant))))
   `(marginalia-value                        ((t (:foreground ,fg))))
   `(marginalia-string                       ((t (:foreground ,string))))
   `(marginalia-number                       ((t (:foreground ,constant))))
   `(marginalia-symbol                       ((t (:foreground ,keyword))))
   `(marginalia-lighter                      ((t (:foreground ,comment))))
   `(marginalia-documentation                ((t (:foreground ,comment :slant italic))))
   `(marginalia-modified                     ((t (:foreground ,attention))))
   `(marginalia-null                         ((t (:foreground ,fg-dim))))
   `(marginalia-file-name                    ((t (:foreground ,fg))))
   `(marginalia-file-priv-dir                ((t (:foreground ,keyword))))
   `(marginalia-file-priv-read               ((t (:foreground ,constant))))
   `(marginalia-file-priv-write              ((t (:foreground ,attention))))
   `(marginalia-file-priv-exec               ((t (:foreground ,added))))
   `(marginalia-file-priv-other              ((t (:foreground ,comment))))
   `(marginalia-file-priv-link               ((t (:foreground ,meta))))
   `(marginalia-date                         ((t (:foreground ,fg-dim))))
   `(marginalia-mode                         ((t (:foreground ,fg-dim))))
   `(marginalia-type                         ((t (:foreground ,type))))

   ;; Ido
   `(ido-subdir                              ((t (:foreground ,keyword :weight bold))))
   `(ido-first-match                         ((t (:foreground ,constant :weight bold))))
   `(ido-only-match                          ((t (:foreground ,added :weight bold))))
   `(ido-indicator                           ((t (:foreground ,attention))))
   `(ido-incomplete-regexp                   ((t (:foreground ,err))))

   ;; -----------------------------------------------------------------
   ;; Dired
   ;; -----------------------------------------------------------------
   `(dired-directory                         ((t (:foreground ,keyword :weight bold))))
   `(dired-symlink                           ((t (:foreground ,meta :slant italic))))
   `(dired-ignored                           ((t (:foreground ,fg-dim))))
   `(dired-flagged                           ((t (:foreground ,err :weight bold))))
   `(dired-marked                            ((t (:foreground ,attention :weight bold))))
   `(dired-header                            ((t (:foreground ,fg-vivid :weight bold))))
   `(dired-perm-write                        ((t (:foreground ,warning))))
   `(dired-broken-symlink                    ((t (:foreground ,err :background ,region))))

   ;; -----------------------------------------------------------------
   ;; Company
   ;; -----------------------------------------------------------------
   `(company-tooltip                         ((t (:foreground ,fg :background ,bg-darker))))
   `(company-tooltip-selection               ((t (:foreground ,fg-vivid :background ,region :weight bold))))
   `(company-tooltip-common                  ((t (:foreground ,match :weight bold))))
   `(company-tooltip-common-selection        ((t (:foreground ,match :background ,region :weight bold))))
   `(company-tooltip-annotation              ((t (:foreground ,fg-dim))))
   `(company-tooltip-annotation-selection    ((t (:foreground ,fg-dim :background ,region))))
   `(company-scrollbar-bg                    ((t (:background ,bg-darker))))
   `(company-scrollbar-fg                    ((t (:background ,fg-dim))))
   `(company-preview                         ((t (:foreground ,fg-dim :background ,bg))))
   `(company-preview-common                  ((t (:foreground ,match))))

   ;; -----------------------------------------------------------------
   ;; Which-key
   ;; -----------------------------------------------------------------
   `(which-key-key-face                      ((t (:foreground ,constant :weight bold))))
   `(which-key-group-description-face        ((t (:foreground ,meta))))
   `(which-key-command-description-face      ((t (:foreground ,fg))))
   `(which-key-separator-face                ((t (:foreground ,fg-dim))))
   `(which-key-note-face                     ((t (:foreground ,comment :slant italic))))
   `(which-key-highlighted-command-face      ((t (:foreground ,attention :weight bold))))
   `(which-key-local-map-description-face    ((t (:foreground ,keyword))))

   ;; -----------------------------------------------------------------
   ;; Magit
   ;; -----------------------------------------------------------------
   `(magit-section-heading                   ((t (:foreground ,fg-vivid :weight bold))))
   `(magit-section-heading-selection         ((t (:foreground ,constant :weight bold))))
   `(magit-section-highlight                 ((t (:background ,region :extend t))))
   `(magit-section-secondary-heading         ((t (:foreground ,type :weight bold))))
   `(magit-branch-local                      ((t (:foreground ,meta :weight bold))))
   `(magit-branch-remote                     ((t (:foreground ,constant :weight bold))))
   `(magit-branch-current                    ((t (:foreground ,attention :weight bold :box t))))
   `(magit-branch-remote-head                ((t (:foreground ,constant :weight bold :box t))))
   `(magit-tag                               ((t (:foreground ,warning))))
   `(magit-hash                              ((t (:foreground ,fg-dim))))
   `(magit-log-author                        ((t (:foreground ,type))))
   `(magit-log-date                          ((t (:foreground ,fg-dim))))
   `(magit-log-graph                         ((t (:foreground ,fg-dim))))
   `(magit-reflog-commit                     ((t (:foreground ,added))))
   `(magit-reflog-amend                      ((t (:foreground ,attention))))
   `(magit-reflog-merge                      ((t (:foreground ,added))))
   `(magit-reflog-checkout                   ((t (:foreground ,meta))))
   `(magit-reflog-reset                      ((t (:foreground ,err))))
   `(magit-reflog-rebase                     ((t (:foreground ,warning))))
   `(magit-reflog-cherry-pick                ((t (:foreground ,added))))
   `(magit-reflog-remote                     ((t (:foreground ,meta))))
   `(magit-reflog-other                      ((t (:foreground ,fg))))
   `(magit-diff-added                        ((t (:foreground ,added :background ,diff-added-bg :extend t))))
   `(magit-diff-added-highlight              ((t (:foreground ,added :background ,diff-added-bg-hl :extend t))))
   `(magit-diff-removed                      ((t (:foreground ,err :background ,diff-removed-bg :extend t))))
   `(magit-diff-removed-highlight            ((t (:foreground ,err :background ,diff-removed-bg-hl :extend t))))
   `(magit-diff-context                      ((t (:foreground ,fg-dim :extend t))))
   `(magit-diff-context-highlight            ((t (:foreground ,fg :background ,region :extend t))))
   `(magit-diff-hunk-heading                 ((t (:foreground ,fg-dim :background ,bg-lighter :extend t))))
   `(magit-diff-hunk-heading-highlight       ((t (:foreground ,fg-vivid :background ,bg-lighter :weight bold :extend t))))
   `(magit-diff-hunk-heading-selection       ((t (:foreground ,constant :background ,bg-lighter :weight bold :extend t))))
   `(magit-diff-file-heading                 ((t (:foreground ,fg-vivid :weight bold))))
   `(magit-diff-file-heading-highlight       ((t (:foreground ,fg-vivid :background ,region :weight bold :extend t))))
   `(magit-diff-file-heading-selection       ((t (:foreground ,constant :background ,region :weight bold :extend t))))
   `(magit-diff-lines-heading                ((t (:foreground ,bg-darker :background ,attention :weight bold :extend t))))
   `(magit-diff-conflict-heading             ((t (:foreground ,bg-darker :background ,err :weight bold :extend t))))
   `(magit-diffstat-added                    ((t (:foreground ,added))))
   `(magit-diffstat-removed                  ((t (:foreground ,err))))
   `(magit-signature-good                    ((t (:foreground ,added))))
   `(magit-signature-bad                     ((t (:foreground ,err :weight bold))))
   `(magit-signature-untrusted               ((t (:foreground ,warning))))
   `(magit-signature-expired                 ((t (:foreground ,warning))))
   `(magit-signature-revoked                 ((t (:foreground ,err))))
   `(magit-blame-heading                     ((t (:foreground ,constant :background ,bg-lighter :weight bold))))
   `(magit-blame-hash                        ((t (:foreground ,fg-dim :background ,bg-lighter))))
   `(magit-blame-name                        ((t (:foreground ,type :background ,bg-lighter))))
   `(magit-blame-date                        ((t (:foreground ,fg-dim :background ,bg-lighter))))
   `(magit-blame-summary                     ((t (:foreground ,fg :background ,bg-lighter))))
   `(magit-blame-highlight                   ((t (:foreground ,fg-vivid :background ,bg-lighter))))
   `(magit-blame-margin                      ((t (:foreground ,fg-dim :background ,bg-lighter))))
   `(magit-cherry-equivalent                 ((t (:foreground ,meta))))
   `(magit-cherry-unmatched                  ((t (:foreground ,attention))))
   `(magit-bisect-good                       ((t (:foreground ,added))))
   `(magit-bisect-bad                        ((t (:foreground ,err))))
   `(magit-bisect-skip                       ((t (:foreground ,warning))))
   `(magit-filename                          ((t (:foreground ,fg))))
   `(magit-header-line                       ((t (:foreground ,fg-vivid :background ,bg-darker :weight bold))))
   `(magit-header-line-key                   ((t (:foreground ,constant :weight bold))))
   `(magit-process-ok                        ((t (:foreground ,added :weight bold))))
   `(magit-process-ng                        ((t (:foreground ,err :weight bold))))
   `(magit-mode-line-process                 ((t (:foreground ,constant))))
   `(magit-mode-line-process-error           ((t (:foreground ,err))))
   `(magit-refname                           ((t (:foreground ,fg-dim))))
   `(magit-dimmed                            ((t (:foreground ,fg-dim))))

   ;; -----------------------------------------------------------------
   ;; Diff mode
   ;; -----------------------------------------------------------------
   `(diff-added                              ((t (:foreground ,added :background ,diff-added-bg :extend t))))
   `(diff-removed                            ((t (:foreground ,err :background ,diff-removed-bg :extend t))))
   `(diff-changed                            ((t (:foreground ,attention))))
   `(diff-refine-added                       ((t (:foreground ,added :background ,diff-added-bg-hl :weight bold))))
   `(diff-refine-removed                     ((t (:foreground ,err :background ,diff-removed-bg-hl :weight bold))))
   `(diff-refine-changed                     ((t (:foreground ,attention :background ,region :weight bold))))
   `(diff-context                            ((t (:foreground ,fg-dim))))
   `(diff-file-header                        ((t (:foreground ,fg-vivid :weight bold))))
   `(diff-header                             ((t (:foreground ,fg-dim :background ,bg-darker))))
   `(diff-hunk-header                        ((t (:foreground ,constant :background ,bg-lighter :weight bold))))
   `(diff-function                           ((t (:foreground ,type))))
   `(diff-index                              ((t (:foreground ,meta))))
   `(diff-indicator-added                    ((t (:foreground ,added))))
   `(diff-indicator-removed                  ((t (:foreground ,err))))
   `(diff-indicator-changed                  ((t (:foreground ,attention))))
   `(diff-nonexistent                        ((t (:foreground ,fg-dim :slant italic))))

   ;; -----------------------------------------------------------------
   ;; Ediff
   ;; -----------------------------------------------------------------
   `(ediff-current-diff-A                    ((t (:background ,diff-removed-bg :extend t))))
   `(ediff-current-diff-B                    ((t (:background ,diff-added-bg :extend t))))
   `(ediff-current-diff-C                    ((t (:background ,region :extend t))))
   `(ediff-fine-diff-A                       ((t (:background ,diff-removed-bg-hl :weight bold :extend t))))
   `(ediff-fine-diff-B                       ((t (:background ,diff-added-bg-hl :weight bold :extend t))))
   `(ediff-fine-diff-C                       ((t (:background ,bg-lighter :weight bold :extend t))))
   `(ediff-even-diff-A                       ((t (:background ,bg-darker :extend t))))
   `(ediff-even-diff-B                       ((t (:background ,bg-darker :extend t))))
   `(ediff-even-diff-C                       ((t (:background ,bg-darker :extend t))))
   `(ediff-odd-diff-A                        ((t (:background ,bg :extend t))))
   `(ediff-odd-diff-B                        ((t (:background ,bg :extend t))))
   `(ediff-odd-diff-C                        ((t (:background ,bg :extend t))))

   ;; -----------------------------------------------------------------
   ;; Treemacs
   ;; -----------------------------------------------------------------
   `(treemacs-root-face                      ((t (:foreground ,fg-vivid :weight bold :height 1.1))))
   `(treemacs-root-unreadable-face           ((t (:foreground ,err :weight bold))))
   `(treemacs-root-remote-face               ((t (:foreground ,meta :weight bold))))
   `(treemacs-directory-face                 ((t (:foreground ,keyword))))
   `(treemacs-directory-collapsed-face       ((t (:foreground ,keyword))))
   `(treemacs-file-face                      ((t (:foreground ,fg))))
   `(treemacs-fringe-indicator-face          ((t (:foreground ,constant))))
   `(treemacs-tags-face                      ((t (:foreground ,constant))))
   `(treemacs-header-button-face             ((t (:foreground ,fg-vivid :weight bold))))
   `(treemacs-marked-file-face               ((t (:foreground ,attention :weight bold))))
   `(treemacs-git-added-face                 ((t (:foreground ,added))))
   `(treemacs-git-modified-face              ((t (:foreground ,attention))))
   `(treemacs-git-renamed-face               ((t (:foreground ,meta))))
   `(treemacs-git-untracked-face             ((t (:foreground ,comment))))
   `(treemacs-git-ignored-face               ((t (:foreground ,fg-dim))))
   `(treemacs-git-unmodified-face            ((t (:foreground ,fg))))
   `(treemacs-git-conflict-face              ((t (:foreground ,err :weight bold))))
   `(treemacs-git-commit-diff-face           ((t (:foreground ,warning))))
   `(treemacs-help-title-face                ((t (:foreground ,constant :weight bold))))
   `(treemacs-help-column-face               ((t (:foreground ,meta))))
   `(treemacs-async-loading-face             ((t (:foreground ,attention :slant italic))))
   `(treemacs-nerd-icons-file-face           ((t (:foreground ,fg-dim))))
   `(treemacs-nerd-icons-root-face           ((t (:foreground ,constant))))

   ;; -----------------------------------------------------------------
   ;; Flymake / Flycheck / compilation
   ;; -----------------------------------------------------------------
   `(flymake-error                           ((t (:underline (:style wave :color ,err)))))
   `(flymake-warning                         ((t (:underline (:style wave :color ,warning)))))
   `(flymake-note                            ((t (:underline (:style wave :color ,meta)))))
   `(flymake-error-echo                      ((t (:foreground ,err))))
   `(flymake-warning-echo                    ((t (:foreground ,warning))))
   `(flymake-note-echo                       ((t (:foreground ,meta))))
   `(flycheck-error                          ((t (:underline (:style wave :color ,err)))))
   `(flycheck-warning                        ((t (:underline (:style wave :color ,warning)))))
   `(flycheck-info                           ((t (:underline (:style wave :color ,meta)))))
   `(flycheck-fringe-error                   ((t (:foreground ,err))))
   `(flycheck-fringe-warning                 ((t (:foreground ,warning))))
   `(flycheck-fringe-info                    ((t (:foreground ,meta))))
   `(compilation-error                       ((t (:foreground ,err :weight bold))))
   `(compilation-warning                     ((t (:foreground ,warning :weight bold))))
   `(compilation-info                        ((t (:foreground ,meta :weight bold))))
   `(compilation-mode-line-fail              ((t (:foreground ,err :weight bold))))
   `(compilation-mode-line-run               ((t (:foreground ,attention :weight bold))))
   `(compilation-mode-line-exit              ((t (:foreground ,added :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Eglot / eldoc
   ;; -----------------------------------------------------------------
   `(eglot-highlight-symbol-face             ((t (:background ,region :weight bold))))
   `(eglot-inlay-hint-face                   ((t (:foreground ,fg-dim :height 0.9 :slant italic))))
   `(eglot-parameter-hint-face               ((t (:foreground ,fg-dim :height 0.9 :slant italic))))
   `(eglot-type-hint-face                    ((t (:foreground ,type :height 0.9 :slant italic))))
   `(eglot-diagnostic-tag-unnecessary-face   ((t (:foreground ,fg-dim))))
   `(eglot-diagnostic-tag-deprecated-face    ((t (:strike-through t))))
   `(eldoc-highlight-function-argument       ((t (:foreground ,match :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Whitespace
   ;; -----------------------------------------------------------------
   `(whitespace-trailing                     ((t (:background ,region :foreground ,attention))))
   `(whitespace-tab                          ((t (:foreground ,bg-lighter))))
   `(whitespace-space                        ((t (:foreground ,bg-lighter))))
   `(whitespace-newline                      ((t (:foreground ,bg-lighter))))
   `(whitespace-empty                        ((t (:background ,attention))))
   `(whitespace-line                         ((t (:background ,bg-darker :foreground ,warning))))
   `(whitespace-indentation                  ((t (:foreground ,bg-lighter))))
   `(whitespace-space-after-tab              ((t (:background ,warning))))
   `(whitespace-space-before-tab             ((t (:background ,warning))))

   ;; -----------------------------------------------------------------
   ;; Breadcrumb
   ;; -----------------------------------------------------------------
   `(breadcrumb-face                         ((t (:foreground ,fg-dim))))
   `(breadcrumb-project-crumbs-face          ((t (:foreground ,fg-dim))))
   `(breadcrumb-project-base-face            ((t (:foreground ,type :weight bold))))
   `(breadcrumb-project-leaf-face            ((t (:foreground ,constant :weight bold))))
   `(breadcrumb-imenu-crumbs-face            ((t (:foreground ,fg-dim))))
   `(breadcrumb-imenu-leaf-face              ((t (:foreground ,keyword :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Mood-line
   ;; -----------------------------------------------------------------
   `(mood-line-buffer-name                   ((t (:foreground ,fg-vivid :weight bold))))
   `(mood-line-buffer-status-modified        ((t (:foreground ,attention))))
   `(mood-line-buffer-status-read-only       ((t (:foreground ,warning))))
   `(mood-line-buffer-status-narrowed        ((t (:foreground ,meta))))
   `(mood-line-major-mode                    ((t (:foreground ,keyword))))
   `(mood-line-status-info                   ((t (:foreground ,meta))))
   `(mood-line-status-neutral                ((t (:foreground ,fg-dim))))
   `(mood-line-status-warning                ((t (:foreground ,warning))))
   `(mood-line-status-error                  ((t (:foreground ,err :weight bold))))
   `(mood-line-status-success                ((t (:foreground ,added))))
   `(mood-line-encoding                      ((t (:foreground ,fg-dim))))
   `(mood-line-unimportant                   ((t (:foreground ,fg-dim))))

   ;; -----------------------------------------------------------------
   ;; Git-gutter / diff-hl
   ;; -----------------------------------------------------------------
   `(git-gutter:added                        ((t (:foreground ,added))))
   `(git-gutter:modified                     ((t (:foreground ,attention))))
   `(git-gutter:deleted                      ((t (:foreground ,err))))
   `(git-gutter-fr:added                     ((t (:foreground ,added))))
   `(git-gutter-fr:modified                  ((t (:foreground ,attention))))
   `(git-gutter-fr:deleted                   ((t (:foreground ,err))))
   `(diff-hl-insert                          ((t (:foreground ,added :background ,added))))
   `(diff-hl-change                          ((t (:foreground ,attention :background ,attention))))
   `(diff-hl-delete                          ((t (:foreground ,err :background ,err))))

   ;; -----------------------------------------------------------------
   ;; Blamer
   ;; -----------------------------------------------------------------
   `(blamer-face                             ((t (:foreground ,meta :slant italic))))

   ;; -----------------------------------------------------------------
   ;; Org mode
   ;; -----------------------------------------------------------------
   `(org-level-1                             ((t (:foreground ,fg-vivid :weight bold :height 1.15))))
   `(org-level-2                             ((t (:foreground ,constant :weight bold :height 1.1))))
   `(org-level-3                             ((t (:foreground ,keyword :weight bold :height 1.05))))
   `(org-level-4                             ((t (:foreground ,type :weight bold))))
   `(org-level-5                             ((t (:foreground ,meta :weight bold))))
   `(org-level-6                             ((t (:foreground ,comment :weight bold))))
   `(org-level-7                             ((t (:foreground ,string :weight bold))))
   `(org-level-8                             ((t (:foreground ,fg :weight bold))))
   `(org-document-title                      ((t (:foreground ,fg-vivid :weight bold :height 1.3))))
   `(org-document-info                       ((t (:foreground ,meta))))
   `(org-document-info-keyword               ((t (:foreground ,fg-dim))))
   `(org-block                               ((t (:background ,bg-darker :extend t))))
   `(org-block-begin-line                    ((t (:foreground ,fg-dim :background ,bg-darker :extend t))))
   `(org-block-end-line                      ((t (:foreground ,fg-dim :background ,bg-darker :extend t))))
   `(org-code                                ((t (:foreground ,string :background ,bg-darker))))
   `(org-verbatim                            ((t (:foreground ,string))))
   `(org-table                               ((t (:foreground ,fg :background ,bg-darker))))
   `(org-formula                             ((t (:foreground ,attention))))
   `(org-todo                                ((t (:foreground ,attention :weight bold))))
   `(org-done                                ((t (:foreground ,added :weight bold))))
   `(org-headline-done                       ((t (:foreground ,fg-dim :strike-through t))))
   `(org-headline-todo                       ((t (:foreground ,fg-vivid))))
   `(org-link                                ((t (:foreground ,meta :underline t))))
   `(org-date                                ((t (:foreground ,constant :underline t))))
   `(org-tag                                 ((t (:foreground ,type :weight bold))))
   `(org-checkbox                            ((t (:foreground ,attention :weight bold))))
   `(org-checkbox-statistics-todo            ((t (:foreground ,attention :weight bold))))
   `(org-checkbox-statistics-done            ((t (:foreground ,added :weight bold))))
   `(org-priority                            ((t (:foreground ,warning :weight bold))))
   `(org-drawer                              ((t (:foreground ,fg-dim))))
   `(org-special-keyword                     ((t (:foreground ,keyword))))
   `(org-meta-line                           ((t (:foreground ,fg-dim :slant italic))))
   `(org-warning                             ((t (:foreground ,warning :weight bold))))
   `(org-quote                               ((t (:foreground ,fg :slant italic))))
   `(org-verse                               ((t (:foreground ,fg :slant italic))))
   `(org-agenda-structure                    ((t (:foreground ,fg-vivid :weight bold))))
   `(org-agenda-date                         ((t (:foreground ,keyword))))
   `(org-agenda-date-today                   ((t (:foreground ,constant :weight bold :underline t))))
   `(org-agenda-date-weekend                 ((t (:foreground ,meta))))
   `(org-agenda-done                         ((t (:foreground ,added))))
   `(org-agenda-clocking                     ((t (:foreground ,attention :weight bold))))
   `(org-agenda-column-dateline              ((t (:foreground ,fg-dim))))
   `(org-scheduled                           ((t (:foreground ,fg))))
   `(org-scheduled-today                     ((t (:foreground ,constant))))
   `(org-scheduled-previously                ((t (:foreground ,warning))))
   `(org-upcoming-deadline                   ((t (:foreground ,warning))))
   `(org-time-grid                           ((t (:foreground ,fg-dim))))

   ;; -----------------------------------------------------------------
   ;; Markdown
   ;; -----------------------------------------------------------------
   `(markdown-header-face-1                  ((t (:foreground ,fg-vivid :weight bold :height 1.15))))
   `(markdown-header-face-2                  ((t (:foreground ,constant :weight bold :height 1.1))))
   `(markdown-header-face-3                  ((t (:foreground ,keyword :weight bold :height 1.05))))
   `(markdown-header-face-4                  ((t (:foreground ,type :weight bold))))
   `(markdown-header-face-5                  ((t (:foreground ,meta :weight bold))))
   `(markdown-header-face-6                  ((t (:foreground ,comment :weight bold))))
   `(markdown-bold-face                      ((t (:foreground ,fg-vivid :weight bold))))
   `(markdown-italic-face                    ((t (:foreground ,fg :slant italic))))
   `(markdown-code-face                      ((t (:foreground ,string :background ,bg-darker))))
   `(markdown-inline-code-face               ((t (:foreground ,string :background ,bg-darker))))
   `(markdown-link-face                      ((t (:foreground ,meta :underline t))))
   `(markdown-url-face                       ((t (:foreground ,constant))))
   `(markdown-list-face                      ((t (:foreground ,attention))))
   `(markdown-blockquote-face                ((t (:foreground ,comment :slant italic))))
   `(markdown-pre-face                       ((t (:foreground ,string :background ,bg-darker))))
   `(markdown-hr-face                        ((t (:foreground ,fg-dim))))

   ;; -----------------------------------------------------------------
   ;; Web mode
   ;; -----------------------------------------------------------------
   `(web-mode-html-tag-face                  ((t (:foreground ,keyword))))
   `(web-mode-html-tag-bracket-face          ((t (:foreground ,fg-dim))))
   `(web-mode-html-attr-name-face            ((t (:foreground ,type))))
   `(web-mode-html-attr-value-face           ((t (:foreground ,string))))
   `(web-mode-html-attr-equal-face           ((t (:foreground ,fg-dim))))
   `(web-mode-doctype-face                   ((t (:foreground ,comment))))
   `(web-mode-css-selector-face              ((t (:foreground ,keyword))))
   `(web-mode-css-property-name-face         ((t (:foreground ,type))))
   `(web-mode-css-color-face                 ((t (:foreground ,constant))))
   `(web-mode-css-pseudo-class-face          ((t (:foreground ,attention))))
   `(web-mode-css-function-face              ((t (:foreground ,type))))
   `(web-mode-css-priority-face              ((t (:foreground ,warning :weight bold))))
   `(web-mode-block-face                     ((t (:foreground ,fg :background ,bg-darker))))
   `(web-mode-comment-face                   ((t (:foreground ,comment :slant italic))))
   `(web-mode-current-element-highlight-face ((t (:background ,region))))
   `(web-mode-string-face                    ((t (:foreground ,string))))
   `(web-mode-symbol-face                    ((t (:foreground ,constant))))
   `(web-mode-keyword-face                   ((t (:foreground ,keyword :weight bold))))

   ;; -----------------------------------------------------------------
   ;; Help / info
   ;; -----------------------------------------------------------------
   `(help-key-binding                        ((t (:foreground ,constant :background ,bg-darker :weight bold :box (:line-width 1 :color ,bg-lighter)))))
   `(help-argument-name                      ((t (:foreground ,type :slant italic))))
   `(info-title-1                            ((t (:foreground ,fg-vivid :weight bold :height 1.3))))
   `(info-title-2                            ((t (:foreground ,constant :weight bold :height 1.2))))
   `(info-title-3                            ((t (:foreground ,keyword :weight bold :height 1.1))))
   `(info-title-4                            ((t (:foreground ,type :weight bold))))
   `(info-menu-header                        ((t (:foreground ,fg-vivid :weight bold))))
   `(info-menu-star                          ((t (:foreground ,attention))))
   `(info-node                               ((t (:foreground ,meta :underline t))))

   ;; -----------------------------------------------------------------
   ;; Flyspell
   ;; -----------------------------------------------------------------
   `(flyspell-incorrect                      ((t (:underline (:style wave :color ,err)))))
   `(flyspell-duplicate                      ((t (:underline (:style wave :color ,warning)))))

   ;; -----------------------------------------------------------------
   ;; GNU Make
   ;; -----------------------------------------------------------------
   `(makefile-targets                        ((t (:foreground ,constant :weight bold))))
   `(makefile-shell                          ((t (:foreground ,fg))))
   `(makefile-space                          ((t (:background ,warning))))

   ;; -----------------------------------------------------------------
   ;; Cider
   ;; -----------------------------------------------------------------
   `(cider-enlightened-face                  ((t (:background ,bg-darker))))
   `(cider-result-overlay-face               ((t (:background ,bg-darker))))
   `(cider-error-highlight-face              ((t (:underline (:style wave :color ,err)))))
   `(cider-warning-highlight-face            ((t (:underline (:style wave :color ,warning)))))
   `(cider-fringe-good-face                  ((t (:foreground ,added))))

   ;; -----------------------------------------------------------------
   ;; ANSI colors (compilation, term, eshell)
   ;; -----------------------------------------------------------------
   `(ansi-color-black                        ((t (:foreground ,bg-darker :background ,bg-darker))))
   `(ansi-color-red                          ((t (:foreground ,err :background ,err))))
   `(ansi-color-green                        ((t (:foreground ,added :background ,added))))
   `(ansi-color-yellow                       ((t (:foreground ,warning :background ,warning))))
   `(ansi-color-blue                         ((t (:foreground ,meta :background ,meta))))
   `(ansi-color-magenta                      ((t (:foreground ,attention :background ,attention))))
   `(ansi-color-cyan                         ((t (:foreground ,string :background ,string))))
   `(ansi-color-white                        ((t (:foreground ,fg :background ,fg))))
   `(ansi-color-bright-black                 ((t (:foreground ,fg-dim :background ,fg-dim))))
   `(ansi-color-bright-red                   ((t (:foreground ,cursor :background ,cursor))))
   `(ansi-color-bright-green                 ((t (:foreground ,string :background ,string))))
   `(ansi-color-bright-yellow                ((t (:foreground ,constant :background ,constant))))
   `(ansi-color-bright-blue                  ((t (:foreground ,meta :background ,meta))))
   `(ansi-color-bright-magenta               ((t (:foreground ,attention :background ,attention))))
   `(ansi-color-bright-cyan                  ((t (:foreground ,string :background ,string))))
   `(ansi-color-bright-white                 ((t (:foreground ,fg-vivid :background ,fg-vivid))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
(provide-theme 'think)

;;; think-theme.el ends here
