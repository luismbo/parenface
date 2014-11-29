[![MELPA](http://melpa.org/packages/parenface-badge.svg)](http://melpa.org/#/parenface)

parenface
=========

The intended purpose of this package is to make parentheses less
visible in Lisp code by dimming them.

Install it via [MELPA][0]:

    M-x package-install RET parenface RET

Enable it in your `.emacs` file:

    (global-parenface-mode)

The option `parenface-modes` controls in what buffers the minor mode
`parenface-mode` is turned on:

  * Arc (including inferior mode)
  * Clojure
  * Emacs Lisp (including IELM)
  * JESS (including inferior mode)
  * Lisp (including interactive mode and SLIME)
  * NRepl
  * Scheme (including inferior mode)

See the `parenface` customization group for more options.

History
-------

**2000** Boris Schaefer posts a snippet implementing `paren-face` for
`scheme-mode` on [comp.lang.scheme][1] and a few days later on
[comp.lang.lisp][2].

**2000** Dave Pearson adds support for `lisp-mode` and
`emacs-lisp-mode` and [posts it to gnu.emacs.sources][3]. This
[classical version][4] is still [available at his website][5] and
served us well for more than a decade.

**2013** Grant Rettke brings parenface to GitHub where he and Zhao Wei
package it up for ELPA and add support for more modes and different
kinds of brackets.

**2013** Jonas Bernoulli rewrites parenface using proper Emacs
interfaces and names it `paren-face`.

**2014** The `paren-face` rewrite is incorporated back into this
project.


[0]: http://melpa.org/#/getting-started
[1]: https://groups.google.com/d/msg/comp.lang.scheme/Gx197UAEwH0/fBtF-CFKTUQJ
[2]: https://groups.google.com/d/msg/comp.lang.lisp/Ux5MDiPSt-0/gZIAtkbmm1YJ
[3]: https://groups.google.com/d/msg/gnu.emacs.sources/gDEb_0CPs8I/aQGZC1-uc6kJ
[4]: http://www.davep.org/emacs/parenface.el
[5]: http://www.davep.org/emacs/
