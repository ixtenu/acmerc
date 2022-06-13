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

## codesearch: indexed search for string or regex

`rg` (see above) has to read every file in the directory being searched.  That
can take a while if searching a large code base (in particular if the files are
not cached).  By contrast, [codesearch][cs] creates an index that allows it to
"identify a set of candidate documents and then run the full regular expression
search against only those documents."  This _can_ be faster although these days
with SSDs and lots of RAM for caching it won't be a huge difference in most
cases.

[cs]: https://github.com/google/codesearch

To install codesearch, you have to have [Go](https://go.dev/).  Then:

```sh
go install github.com/google/codesearch/cmd/...@latest
# Older versions of Go might need to do this instead:
go get github.com/google/codesearch/cmd/...
```

codesearch has two executables, `cindex` and `csearch`.  `cindex` is used
to index (or reindex) a directory, e.g.:

```sh
cindex $PLAN9/src
```

Then `csearch` is used to search the indexed directories, e.g.:

```
% csearch -n scrlresize
/usr/local/plan9/src/cmd/acme/acme.c:553:                       scrlresize();
/usr/local/plan9/src/cmd/acme/fns.h:17:void     scrlresize(void);
/usr/local/plan9/src/cmd/acme/scrl.c:47:scrlresize(void)
/usr/local/plan9/src/cmd/acme/scrl.c:64:                scrlresize();
```

Both commands can easily be run within Acme, in a `win` shell or from the
tag bar.  As with `grep`, `csearch` needs an `-n` option to print the line
number, which is desirable within Acme since it allows using mouse-3 to jump to
the line.

The above example used the plan9port source tree, but it's too small for
codesearch to have a speed advantage on modern hardware.  On the machine
I'm typing this on, `csearch scrlresize` completed in 0.00 seconds, but `rg
scrlresize` only takes 0.02 seconds (warm cache).  Even on the much larger
Linux kernel source tree, `rg` finishes in less than a second (warm cache) with
any query: `csearch` is even faster, but `rg` is often fast enough.  (`grep`
is slower than either `csearch` or `rg`.)

While the theoretical speed advantages may not always be appreciable in
practice, codesearch has another useful property: by default it adds all
indexed directories to an index at `HOME/.csearchindex`.  This allows using
`csearch` to search across directories that are scattered around the file
system.  For example, you could index directories such as:

```sh
cindex $PLAN9/src
cindex $HOME/src/linux/torvalds
cindex /usr/include
```

With that, `csearch foobar` would search for "foobar" in all of those
directories.  The same can be accomplished with `rg` or `grep`, but it would be
necessary to explicitly list the directories to be searched; using `csearch`
is more convenient.  `cindex` continues to be very fast even when many large
source directories are indexed, so it's safe to index all your source trees.
A functionally comparable shell script which ran `rg` across all your source
trees would become linearly slower as more source was added and would
cause many files to be read into the cache that you were't using (possibly
evicting more useful cached files).

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

```
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

- [acme-lsp](https://github.com/fhs/acme-lsp)
- [A](https://github.com/davidrjenni/A)
- [acmego](https://github.com/9fans/go/tree/main/acme/acmego)
- [clangd](https://marc.info/?l=9fans&m=162945705107609&w=2)
