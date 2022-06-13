# Complementary Tools

## fd: search for a file name

Some projects are split across numerous deeply-nested directories; it is common
to remember the file name but not the directory where it lives.  [fd][ghfd]
can be used within Acme to search for a file name.  For example, executing
(mouse-2) `fd 9` in an Acme window whose PWD is this repository yields a
`+Errors` window with the following contents:

[ghfd]: https://github.com/sharkdp/fd

```
./bin/9a
./bin/9s
```

Mouse-3 on the file name will open it within Acme.  `fd` has many useful
options to limit searching to files with certain types, extensions, etc.

While `find` can also be used, `fd` is faster and Git-aware (by default it
ignores the `.git` directory and everything listed in `.gitignore`).  `fd`
is available as a package on most Unix-like systems; on Debian-based Linux
distributions, the package is `fd-find` and the executable is `fdfind`.

## rg: recursive search for string or regex

[ripgrep][ghrg] (`rg`) can be used within Acme to search for a string.
For example, executing (mouse-2) `rg --vimgrep AUTHOR` in an Acme window whose
PWD is this repository yields a `+Errors` window with the following contents:

[ghrg]: https://github.com/BurntSushi/ripgrep

```
LICENSE:6:42:THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
LICENSE:8:37:AND FITNESS.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
```

With `--vimgrep`, `rg` outputs the line and column numbers.  Mouse-3 on
the `file:line:column` in the output (e.g., `LICENSE:6:42`) opens
the file in Acme and positions the cursor on the line and column
number where the search term was found.  To avoid repeatedly typing
`--vimgrep`, a wrapper script for `rg` can be created (like [this
one](https://github.com/ixtenu/script/blob/master/s)).

While `grep -R` can also be used, `rg` is faster and Git-aware (by default it
ignores the `.git` directory and everything listed in `.gitignore`).  `rg` is
available as a package (sometimes called `ripgrep`) on most Unix-like systems.

## ctags: jump to definition

[ctags][uctg] "generates an index (or tag) file of language objects found
in source files for programming languages."  In effect, it creates an index
of where objects are defined; with C, the indexed objects include functions,
global variables, macros, types, enumerations, and structure members.  ctags
supports around 135 programming languages.

[uctg]: https://docs.ctags.io/en/latest/

It is possible to use ctags within Acme to provide "jump to definition"
functionality.  The first step is to create the `tags` file, e.g.:

```sh
cd $PLAN9/src/cmd/acme
ctags -R
```

The `tags` file stores the location of each object as a pattern rather than
by line number, so it does not immediately become out-of-date as lines are
inserted or removed.  However, when object definitions are modified or moved
between files, the `tags` file will become stale and need to be regenerated.
Fortunately, `ctags` is fast.

Unlike [some other editors][ctagedt], Acme does not natively support reading
from the `tags` file, but this can be done with a script.  The one I use is
called [tag][tag].  Continuing the previous example:

[ctagedt]: https://en.wikipedia.org/wiki/Ctags#Editors_that_support_ctags
[tag]: https://github.com/ixtenu/script/blob/master/tag

```sh
% tag readfile
/usr/local/plan9/src/cmd/acme/acme.c:286
/usr/local/plan9/src/cmd/acme/mail/mesg.c:333
```

Although `tag` can be run in a terminal or `win` shell, normally I use it
in the tag bar with the 2-1 mouse chord.  To do so, add "`tag`" to a window
with an appropriate directory (i.e., the `tags` file must exist in the same
directory or one of its parent directories).  In the source code window,
double-click (mouse-1) on the symbol to be looked up.  Then mouse-2 click and
hold on the `tag` in the tag bar, and (with mouse-2 still held down) mouse-1
click to pass the selection as an argument to `tag`, then release both mouse-1
and mouse-2 (in either order).  If at least one definition is found, the
`filename:lineno` will be output to the `+Errors` window, and can be mouse-3
clicked to open.

`ctags` is available as a package on most Unix-like systems; it
might be called `universal-ctags` to distinguish it from the older
unmaintained `exuberant-ctags`.  On macOS, be aware that Xcode includes
`/usr/bin/ctags`, which is an older implementation, whereas Homebrew
installs its `universal-ctags` at either `/usr/local/bin/ctags` (Intel) or
`/opt/homebrew/bin/ctags` (Apple Silicon): be sure to run the Homebrew version.

## Others (TODO)

TODO: Research using the following with Acme and describe them here if they
are useful.

- [codesearch](https://github.com/google/codesearch)
- [acme-lsp](https://github.com/fhs/acme-lsp)
- [A](https://github.com/davidrjenni/A)
- [acmego](https://github.com/9fans/go/tree/main/acme/acmego)
- [clangd](https://marc.info/?l=9fans&m=162945705107609&w=2)
