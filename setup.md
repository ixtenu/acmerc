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

TODO: Document instructions for running Xorg in pre-WSLg WSL (which allows using
plan9port's Acme on Windows 10).

## Running Acme

While Acme can be started by invoking the `acme` executable directly,
typically it is desirable to define several environment variables and to pass
in arguments to control the fonts.  For this reason, Acme is usually opened via
a wrapper script.  The one in this repository is called `a`.

```sh
# Create shortcut
git clone https://github.com/ixtenu/acmerc ~/acmerc
ln -s ~/acmerc/bin/a ~/bin/a
# Run Acme (asynchronous)
a
```

## Helper Scripts

Acme is intended to be extended via the toolbox of utility programs found on a
Unix (or Plan 9) system.  Often it is handy to create wrapper scripts that build
upon Unix programs such as `sed(1)` or `fmt(1)` to perform common functions.
Several of the text filtering scripts in
[ixtenu/script](https://github.com/ixtenu/script) are useful within
Acme:

```sh
git clone https://github.com/ixtenu/script ~/script
script/install.sh
```

## Developer Tooling

TODO: Add instructions for installing supporting tools for Go specifically and
software development in general.

- [codesearch](https://github.com/google/codesearch)
- [acme-lsp](https://github.com/fhs/acme-lsp)
- [A](https://github.com/davidrjenni/A)
- [acmego](https://github.com/9fans/go/tree/main/acme/acmego)
- [clangd](https://marc.info/?l=9fans&m=162945705107609&w=2)
