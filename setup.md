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

## Patching Acme (optional)

Optionally, apply the Acme patches from this repository.  Currently, there are
two independent patches; you can apply either or both.  If applying both, they
can be applied in either order (they don't modify the same files).

- [acme-dark-theme.patch](acme-dark-theme.patch) changes the Acme color theme.
- [acme-tab-expand.patch](acme-tab-expand.patch) (__experimental__) adds
  support for expanding tabs to spaces (for further details, refer to the text
  at the top of the patch file).

```sh
# Enter the plan9port directory
cd /usr/local/plan9

# Create a branch (helps to have a branch when maintaining out-of-tree patches)
git switch -c ixtenu-acme

# Apply the patches.  If the Acme source files have been modified by the
# upstream plan9port since the patches were generated, Git will attempt to
# merge the changes, but if that fails you might have to resolve the merge
# conflicts by hand.
git am ~/acmerc/acme-dark-theme.patch
git am ~/acmerc/acme-tab-expand.patch

# Rebuild Acme
cd src/cmd/acme
mk install
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

While plan9port does not change rapidly, it is updated.  If no patches were applied,
updating is simple:

```sh
cd $PLAN9
git pull
# If there were new commits:
./INSTALL
```

If you patched Acme, do this instead (here assuming `ixtenu-acme` is the name
of the branch with the patched version of Acme):

```sh
cd $PLAN9
git switch master
git pull
git switch ixtenu-acme
# If there were new commits:
git rebase master
./INSTALL
```

`git rebase master` will attempt to merge, but if that fails, merge conflicts
will have to be resolved by hand.
