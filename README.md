parenface-plus
==============

Dave Pearson <davep@davep.org> released the excellent parenface package which fontifies parentheses in Lispy modes in Emacs here: http://www.davep.org/emacs/parenface.el

My addition was to add support for editor and REPL modes of:
* Clojure 
* nREPL
* IELM
* Jess
* inferior-jess

How to use:  

    (eval-after-load 'parenface-plus
      (progn
        (set-face-foreground 'parenface-paren-face "SteelBlue4")
        (set-face-foreground 'parenface-bracket-face "SteelBlue4")
        (set-face-foreground 'parenface-curly-face "SteelBlue4")))
