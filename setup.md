# Acme Text Editor Setup

## Install Plan 9 from User Space

[Plan 9 from User Space](https://9fans.github.io/plan9port/) (a.k.a. plan9port)
ports many programs from the Plan 9 operating system, including the Acme text
editor, to Unix-like operating systems.  For Microsoft Windows, plan9port can
be used in WSL: refer to [setup-wsl.md](setup-wsl.md) and then return here.

Obtain plan9port.  While various packages exist (e.g., in FreeBSD, Homebew, and
the Arch Linux repositories), it is better to use the most up-to-date version,
which means compiling from source.

```sh
sudo mkdir /usr/local/plan9
sudo chown $(id -u -n):$(id -g -n) /usr/local/plan9
git clone https://github.com/9fans/plan9port /usr/local/plan9
```

Notes:

- `/usr/local/plan9` is the "usual" directory for plan9port, but it can go
  elsewhere, such as `$HOME/plan9`.  Just be sure that the `PLAN9` shell
  variable is set correctly.
- There are many [forks](links.md#forks) of plan9port that make changes to
  Acme that would not be accepted by upstream, such as alternate color schemes,
  additional key bindings, or support for tab expansion.  You might want to use
  one of these or create your own.  If so, the fork's URL can be substituted
  above.

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

For notes on tools which complement Acme (with a focus on software
development), see [tools.md](tools.md).

## Updating plan9port

While plan9port does not change rapidly, it is updated.  If using the upstream
plan9port, updating is simple:

```sh
cd $PLAN9
git pull
# If there were new commits:
./INSTALL
```

If using a plan9port fork, you will have to merge the upstream changes into
your repository or branch.
