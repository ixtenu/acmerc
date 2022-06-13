# Acme Text Editor Setup

## Install Plan 9 from User Space

[Plan 9 from User Space](https://9fans.github.io/plan9port/) (a.k.a. plan9port)
ports many programs from the Plan 9 operating system, including the Acme text
editor, to Unix-like operating systems.

Obtain plan9port.  While various packages exist (e.g., in FreeBSD, Homebew, and
the Arch Linux repositories), it is better to use the most up-to-date version,
which means compiling from source.

```sh
sudo mkdir /usr/local/plan9
sudo chown $(id -u -n):$(id -g -n) /usr/local/plan9
git clone https://github.com/9fans/plan9port /usr/local/plan9
```

(`/usr/local/plan9` is the "usual" directory for plan9port, but it can go
elsewhere.)

On macOS, Xcode needs to be installed (it can be found in the Mac App Store).
On Linux and \*BSD systems (but not macOS), plan9port uses X11; on some
distributions, the X11 header files are split into separate packages that need
to be installed separately.

```sh
# Debian
sudo apt-get install libx11-dev libxext-dev libxt-dev
# Ubuntu
sudo apt-get install xorg-dev
# On FreeBSD, OpenBSD, and Arch Linux, installing Xorg seems to install the
# necessary headers.  Other distributions may vary.
```

Optional: Apply [acme-dark-theme.patch](./acme-dark-theme.patch) from this
repository to change the Acme color theme.

```sh
# The patch assumes the plan9port directory is the current directory.
cd /usr/local/plan9

# On *BSD, patch(1) will be noisy ("Hmm...  The next patch looks like a unified
# diff to me...") but it will apply the patch nonetheless.  If plan9port updates
# the Acme source files, the patch may apply with fuzz or some hunks may fail to
# apply at all -- in the latter case, the patch needs to be applied by hand (and
# then Git can be used to generate an updated version for future use).
patch -p1 < ~/acmerc/acme-dark-theme.patch

# On *BSD or if the patch applied with fuzz, *.orig files will be generated;
# these have no value since the files are in a Git repository.
rm -f src/cmd/acme/*.orig
```

Build plan9port:

```sh
cd /usr/local/plan9
./INSTALL
```

Define `$PLAN9` and update `$PATH` in the initialization file for your shell
of choice, e.g.:

```sh
echo 'export PLAN9=/usr/local/plan9' >> ~/.zshrc
echo 'export PATH=$PATH:$PLAN9/bin' >> ~/.zshrc
```

## Installing plan9port on Windows

Plan 9 from User Space can be installed within the Windows Subsystem for Linux
(WSL).  I have only tried this on WSL 2 (which runs a virtualized Linux kernel),
not the older WSL 1 (which merely emulates Linux).

[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) if you have
not already done so.  I have only used Ubuntu (the default Linux distribution
for WSL) but other supported distros (e.g., openSUSE or Debian) will probably
work also.

### X11 in WSL

WSLg (Windows Subsystem for Linux GUI) has support for X11 or Wayland GUI
applications.  WSLg was released as part of Windows 11 and was also available
in Windows 10 insider builds.  If you have WSLg, skip this section.  I only
have access to Windows 10 (and I'm not using insider builds), so I have not
tried to use plan9port applications with WSLg, but I presume it would "just
work".

It is possible to run X11 applications (like plan9port Acme) with a pre-WSLg
version of WSL, but this requires manual setup:

- Download and install [VcXsrv](https://sourceforge.net/projects/vcxsrv/),
  which is a version of the Xorg server that has been ported to Windows.  The
  installation defaults are fine.
- An "XLaunch" item will have been added to the Start Menu.  Open it.  Change
  two of the default settings:
  - On the first screen, the "Display number" must be `0`.
  - On the third screen, "Disable access control" must be selected.
  - See [here](https://github.com/microsoft/WSL/issues/4106#issuecomment-502920377)
    for screenshots of launching VcXsrv with these settings.
- When VcXsrv is running, there will be an X logo icon in the system tray.
  To close VcXsrv, right click on its icon and select "Exit...".

Open WSL.  Install Xorg and the X11 development headers.  For example, on
Ubuntu:

```sh
sudo apt install xorg xorg-dev
```

Test that you can launch an X11 application:

```sh
export DISPLAY=$(/sbin/ip route | awk '/default/ { print $3 }'):0
xcalc &
```

Add the `export DISPLAY` line to your shell's initialization file (e.g.,
`~/.bashrc` or `~/.zshrc`).  For example:

```sh
# If running in WSL...
if [ -d /mnt/c/Windows ]; then
    # Set DISPLAY for VcXsrv
    export DISPLAY=$(/sbin/ip route | awk '/default/ { print $3 }'):0
fi
```

That's it.  Adapted from:
[VcXsrv & Win10 "Alternative Setup"](https://sourceforge.net/p/vcxsrv/wiki/VcXsrv%20%26%20Win10/).

### Install plan9port in WSL

Once WSL 2 is installed, and X11 is working (either via WSLg or, as detailed
above, via a third-party X server), plan9port can be installed as normal.
See the [Install Plan 9 from User Space](#install-plan-9-from-user-space)
section above.

## Running Acme

While Acme can be started by invoking the `acme` executable directly,
typically it is desirable to define several environment variables and to pass
in arguments to control the fonts.  For this reason, Acme is usually opened via
a wrapper script.  The one in this repository is [bin/9a](bin/9a).

```sh
# Create shortcut
git clone https://github.com/ixtenu/acmerc ~/acmerc
ln -s ~/acmerc/bin/9a ~/bin/9a
# Run Acme (asynchronous)
9a
```

## Helper Scripts

Acme is intended to be extended via the toolbox of utility programs found on a
Unix (or Plan 9) system.  Often it is handy to create wrapper scripts that build
upon Unix programs such as `sed(1)` or `fmt(1)` to perform common functions.
Several of the scripts in [ixtenu/script](https://github.com/ixtenu/script) are
useful within Acme:

```sh
git clone https://github.com/ixtenu/script ~/script
script/install.sh
```

## Tools

### Search for a file name

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

### Recursive search for string

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

### Code navigation with ctags

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

### More tools (TODO)

TODO: Research using the following with Acme and describe them here if they
are useful.

- [codesearch](https://github.com/google/codesearch)
- [acme-lsp](https://github.com/fhs/acme-lsp)
- [A](https://github.com/davidrjenni/A)
- [acmego](https://github.com/9fans/go/tree/main/acme/acmego)
- [clangd](https://marc.info/?l=9fans&m=162945705107609&w=2)
