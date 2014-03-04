parenface-plus
==============

Dave Pearson <davep@davep.org> released the excellent parenface package which
fontifies parentheses in Lispy modes in Emacs [here] (www.davep.org/emacs/parenface.el).

Zhao Wei added square and squiggly bracket support.

Supported modes:

* Arc (including inferior mode)
* Clojure
* Emacs Lisp (including IELM)
* JESS (including inferior mode)
* Lisp (including interactive mode and SLIME)
* NRepl
* Scheme (including inferior mode and cmuscheme

How to use:

    (eval-after-load 'parenface-plus
      (progn
        (set-face-foreground 'parenface-paren-face "SteelBlue4")
        (set-face-foreground 'parenface-bracket-face "SteelBlue4")
        (set-face-foreground 'parenface-curly-face "SteelBlue4")))
