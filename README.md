# think-theme.el

A low contrast dark theme for Emacs.

## Screenshots:

![Classic Theme](https://raw.githubusercontent.com/VernonGrant/think-theme.el/master/img/think-theme.jpg "Think theme for Emacs")

## Transparent background

```lisp
;; Make the background transparent if we're in the terminal.
(defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
```
